Received: from outbound.mr.icloud.com (p-west2-cluster1-host9-snip4-2.eps.apple.com [57.103.68.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A677F278779
	for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 04:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.68.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772254665; cv=none; b=aKrjoaaxZmzMiEvoB/MM4gvfZnQm4GcHWeQACYfQOlLLqOTIRPeG1TdUrEDfftbnQaJyyumzyyU1gCyQNjWoKHFOvR4YeOcb3STcJMK83cts77DIjJDPilr6Ukx6r+w/qvyqlPB6n4jfyRwp5VJ265fb6NyTrLElJkEwtY3pFj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772254665; c=relaxed/simple;
	bh=063ewJv/YAemkyeSfp2FebKfF4jIX3yGTonQugH7B2w=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Z8L/QMXnYIHNfQDlFvw2kl06xco3YacpBcq+VGbwPsISVTrej4H0ooFiyJtuhKhliwfp6lWbNg7Ua9P0ZYwdzn2Jc2aapC4k6YMyf7McpVfV6AD4sYWdt7EQGRBj6rLK1q1t2/Li+8xZzrKw48UCJiXH9O+v9+yOMryEKVvH2vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=PpeAujFs; arc=none smtp.client-ip=57.103.68.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="PpeAujFs"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-20-percent-0 (Postfix) with ESMTPS id A3AD818000A6;
	Sat, 28 Feb 2026 04:57:40 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1772254663; x=1774846663; bh=ZFoxxR059KEGMvHR18OKW5lb4iSOzmkLoPEKF12fCHg=; h=Date:Message-Id:To:Subject:From:Mime-Version:Content-Type:x-icloud-hme; b=PpeAujFsSngEo5IzecL5UrK8sJfoQJoPCxO9hhAtotAJbKl05PecfQX5vMK5AbVw5w3s7JaaGf1WtKtnbLd8Z5PoQBWXkcWxs2oTcvzMQH6g2q+qKK2tHIvHIqJwvBPsjm62asjXmKJ0Q6PXasSTi+9P7EkepWkAMM9YkhM10y2k0GKeYRWqcYajkqHGl5A7u2B1U5VUsP4YRtFIgXWBJXrG5CiWphrwERRKZ0d3l1+Y2SagRJLv/Q5kmEZ3DeSJ399OUUrKYU2Ge9yq8JDR45ssA9Vm9NJfzU3BYMFGh7+k80vIqSQXn/4oPp1w/JH8iKfop5MmLjDtYRE0ky+G7A==
mail-alias-created-date: 1769500909675
Received: from localhost (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-20-percent-0 (Postfix) with ESMTPSA id 95C96180011B;
	Sat, 28 Feb 2026 04:57:37 +0000 (UTC)
Date: Sat, 28 Feb 2026 13:57:36 +0900 (JST)
Message-Id: <20260228.135736.1884264730579282484.fujita@bee>
To: a.hindborg@kernel.org
Cc: boqun.feng@gmail.com, fujita.tomonori@gmail.com, frederic@kernel.org,
 lyude@redhat.com, tglx@kernel.org, anna-maria@linutronix.de,
 jstultz@google.com, sboyd@kernel.org, ojeda@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: hrtimer: add active() method to query timer state
From: FUJITA Tomonori <tomo@aliasing.net>
In-Reply-To: <20260215-hrtimer-active-v1-1-a754d10492c2@kernel.org>
References: <20260215-hrtimer-active-v1-1-a754d10492c2@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA0MyBTYWx0ZWRfXxLgk8a6Fyjqq
 2b/LnFPmVIi+wwyAd+hkUvK1mH+0NouSjmx5dcMSbDVMyvvM8PazxfPmuZOUkVl0BTZE+Pj0IFm
 mX576D5ntps9RQapUndXOzCv3Irpl/tlN6Wr4e/kRVgrM/DgLsq/GRirDvkGRzLdZfx9yRUI9Dx
 Nng17uFMg0V9zfVq+FbTELEua1JBwv5qUg0/f+C9KG1FfddsVtppu67lOVbu7YwuDJWz9oQFXv3
 C9SwPsV6/MK2MMX0HfLMZxPT8zasbvHjGynT4J754eyrrFLWRfP0grfV1oUrgWA6V5PeFKpDSoQ
 knkaxnhP0l780zne3X0ZYGjmndoWOxkCpHtIR6FIHFAnSi7Fg5icddryPd1i9A=
X-Proofpoint-GUID: qS6SyvJOLR7mNf-AVnF05cGLPheegX_6
X-Proofpoint-ORIG-GUID: qS6SyvJOLR7mNf-AVnF05cGLPheegX_6
X-Authority-Info-Out: v=2.4 cv=Ra2dyltv c=1 sm=1 tr=0 ts=69a275c6
 cx=c_apl:c_apl_out:c_pps a=9OgfyREA4BUYbbCgc0Y0oA==:117
 a=9OgfyREA4BUYbbCgc0Y0oA==:17 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=6-Sg7PK_DtO1-vc-HzEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1030
 mlxlogscore=624 spamscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602280043
X-JNJ: AAAAAAABHM72Edx58mszJbJe1zc9bp/+qirsxNvbahsgtNSSdQkYcBavRakckKIqNmc0FOUGyISRkfsJNgJ4SKwCK8e6xDNZElDe62bssZ4qpZFiikzuey6pCLsHtkfXuUVQPF4GseyBunS4MuR3bqVzyZWJpUtvhn9xj9YCJtPauQCK8CpJ83xM3lL7Xn25BZDoV0DD1Vcyen/lfN0HQgPdHZgouMIT9/vVGjZQ0VH71CNd8eXGbVtFp1/3x7rWxxx8fxj6/tEH9xUSF+J7DPf7yyK5hQX86VoomL7uJbJHp+z4cfLdA5OSdM2lVkLNDRPKbGYYF1UsxJxzZOlzGhX4Ju6z+/7V6vEMOkOqDutodhRVGru4fnraNSOXTVLMTSOZFS9NpUjXH0bD5zpD5g2oFYICJfAX453WhzYoarKqhu8d2SJD/0Pe4qrx/DbGlTt0PCnOqjSOURtKneu23n+4+KWNayMh3T7sNXmLCYWyEp5s2AQSvgkLpDdux/C6SrTr2gEhveBD2yoXmCyNQmo0DxtC/1B58mBjbZjCgjrA6XyHYjC0F56EtNB3lUWCv3P3Xs0y/NtdNujNGjNEazo1TktLQluqmS0wejhIXFgLVJNddLm3sexiNVLLSE9sj/iwnySoDPUY3azqawfNoRI5YID/ns8DsjMSYHMUdKCaq1D3RrF6MECcEw4nH5loI9Pjn9VLrsI3xMLazPJtYyonVOcoKLFJSjbs1AE5qpPnwgapPjWKr9y+SvKxtdpzczxX3dSaVG4N1lqg6rTJaRKcCoGg5yvbrli0zFkAkbUiSlJe+ZqiiV1Q4WBs6nTqaUaF7yYmnodt3GEIJKK5tNS7

On Sun, 15 Feb 2026 21:29:53 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> Add an `active()` method to HrTimer that returns true if the timer is in
> the started or running states. This wraps the kernel's hrtimer_active()
> function.
> 
> Also add documentation clarifying the definition of an active timer.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/time/hrtimer.rs | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

