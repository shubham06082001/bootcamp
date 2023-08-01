import java.util.Arrays;
import java.util.Scanner;

class CallRating {
  String callId;
  int callDuration;
  double callQuality;
  String ratingCategory;

  public CallRating(String callid, int callDuration, double callQuality, String ratingCategory) {
    super();
    this.callId = callid;
    this.callDuration = callDuration;
    this.callQuality = callQuality;
    this.ratingCategory = ratingCategory;
  }

  @Override
  public String toString() {
    return "CallId: [" + callId + "], Call Duration: " + callDuration + " minutes, Call Quality: " + callQuality
        + ", Rating Category: " + ratingCategory + "\n";
  }

}

public class CallRatingSystem {

  public static void main(String[] args) {

    Scanner s = new Scanner(System.in);
    int[] callDurations = new int[5];
    double[] callQualities = new double[5];
    System.out.println("Enter call durations array: ");
    for (int i = 0; i < 5; i++) {
      callDurations[i] = s.nextInt();
    }
    System.out.println("Enter call qualities array:");
    for (int i = 0; i < 5; i++) {
      callQualities[i] = s.nextDouble();
    }

    CallRating[] callRatings;
    callRatings = rateCalls(callDurations, callQualities);
    System.out.println(Arrays.toString(callRatings));

  }

  public static CallRating[] rateCalls(int[] callDurations, double[] callQualities) {

    int a = callDurations.length;
    CallRating[] callRatings = new CallRating[a];
    for (int i = 0; i < a; i++) {
      callRatings[i] = new CallRating(String.valueOf(i), callDurations[i], callQualities[i], "");
    }

    for (int i = 0; i < a; i++) {
      double ratingScore = callQualities[i] / callDurations[i];
      if (ratingScore >= 0.08)
        callRatings[i].ratingCategory = "Excellent";
      else if (ratingScore >= 0.05)
        callRatings[i].ratingCategory = "Good";
      else
        callRatings[i].ratingCategory = "Average";
    }
    return callRatings;
  }

}
