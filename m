Received: from outbound.pv.icloud.com (pv-2001b-snip4-3.eps.apple.com [57.103.64.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA483E867C
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 14:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759012; cv=none; b=jCW2jNVMu9/BDPcQfDn26OKk6zTaqsVVnP1hEueEO/RT7Nq6CpiLHx8ivjIleC/nl3rAAT+tNgjp3MxFlAufCOryKf7Te0P/766W6fO911uuBc5K5yvK0IHaK59+rO/BS8+Qv1M5bC+GFzWk4cqLVbAaf7czwF7hJjkom/vP9w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759012; c=relaxed/simple;
	bh=EN4THpN3VqyQF2w+rMfC+eWsm/QDClEDGyZQwV1YeHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pUw+Qy287Bc7HfvYS0WPgY1nHys9gB3IU0ORaEnYc+a2RiGa3PNktCFfxF2oozjd8BgQYfgHqvftr4GJxvr1DyTniN/Z6Pb8sBqAFhaAeBcDWxI53FPfwUdRpKYErw3E8wQhwGkeZhOFAkKHmWK9q6Vy749k61EYUv7DVzZixVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=zFoI6YpA; arc=none smtp.client-ip=57.103.64.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="zFoI6YpA"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-4 (Postfix) with ESMTPS id 36A611800118;
	Tue, 17 Mar 2026 14:50:08 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1773759010; x=1776351010; bh=KnTnv0WO1WeD6UIqFYUTwgAn8I9b7HtpOLAyFjdzJSw=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=zFoI6YpAAZib2VkBj6PFpuYvrCR3tYMqTgYu30jSBeSwzk6EJpjSjx2c6hIbV2XkcDg7kp05MGB0E4ERhoxmtd9T93nHafYPgYslMxuZfGxkmqdQ2Xnt0LYGvo+fDIWcafxZEoR93UfVksqmENDazmcCrRJKfw/TlXsItRz+gytOlnbaLsZ759wBTKkRufR2jJzyI1Zti2UmcQZVybY2UZK82RCTRe/IpWsZX60+XqAhlu4wS7MEiEY9yGmvLm6qjRIeHciTZoBNxtfWYXlBj2KJzHPksTHXQYkMUEfQIwSQh5eZjH2e4eaI5MizGdcK1auwbokDI8iHvzsZxGkoWQ==
mail-alias-created-date: 1772007648188
Received: from [127.0.0.1] (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-4 (Postfix) with ESMTPSA id AE9131800112;
	Tue, 17 Mar 2026 14:50:03 +0000 (UTC)
From: Mohamad Alsadhan <mo@sdhn.cc>
Date: Tue, 17 Mar 2026 17:49:42 +0300
Subject: [PATCH v3 1/6] rust_binder: remove "rust_" prefix from tracepoints
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rust-binder-trace-v3-1-6fae4fbcf637@sdhn.cc>
References: <20260317-rust-binder-trace-v3-0-6fae4fbcf637@sdhn.cc>
In-Reply-To: <20260317-rust-binder-trace-v3-0-6fae4fbcf637@sdhn.cc>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Mohamad Alsadhan <mo@sdhn.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2587; i=mo@sdhn.cc;
 h=from:subject:message-id; bh=EN4THpN3VqyQF2w+rMfC+eWsm/QDClEDGyZQwV1YeHA=;
 b=owGbwMvMwCV2WSbwWIGm61bG02pJDJk7s8QC25w26xyS6DRZFHprf75xJtM3FvuAVi2JMMMzr
 w/suuPTUcrCIMbFICumyPL8vPfRgz9umJ05v/cUzBxWJpAhDFycAjAROTFGhg3yu2UTykV+qYie
 vqgUxuCjs7sz6qhg67eT8y4+VVeJTWL4Z/IhPrFrV7vYTQZT2eqnr9x/3phQEuka6+n5/YfikuP
 aXAA=
X-Developer-Key: i=mo@sdhn.cc; a=openpgp;
 fpr=E7CF4BC5C1F8D836CCCFBDCAD31C51C6702945B5
X-Proofpoint-GUID: j6nZ4Pm1omiYkgTe2dmY3vYkFyZ8EP4S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEzMSBTYWx0ZWRfX0aB22v80Qlff
 hCACIWgnSbm4TW7EALIk1iQznCdcBn1jflzZoBpiKzemKW75AFkEYzc0O3cWWURBT3jdkQI2Ucw
 rfUe5YVI+AUa4kFO0M3tJL/f6yQQYMfP0A+/ZzXEmJZK1QzzojdhiHW+9pClBlr8oXxrv/VTzep
 iMBmzVy30sy0d3jNwfp4patDQ8COgKSqsSSPutvPn4+s5j3NaeVVTg97sYcMPbGOIZXFMGGunlw
 QQw8rjTX0SLXNtUU0VDaRkqIphCWqOCUg6eT22LNLMg9MqYgynfCHiCrJCzPtULPKUKB5ESi5Bq
 tz5byIMGqpMaRudyhuDHWh5l13fw7GEs6y4dP0hEK9UzqGxwvLmxGKUMUVjfrw=
X-Authority-Info-Out: v=2.4 cv=fLk0HJae c=1 sm=1 tr=0 ts=69b96a21
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10
 a=1oJP67jkp3AA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=1XWaLZrsAAAA:8 a=9KE4tSwBFA36Xu7-v7wA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: j6nZ4Pm1omiYkgTe2dmY3vYkFyZ8EP4S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=648
 malwarescore=0 mlxscore=0 bulkscore=0 phishscore=0 clxscore=1030
 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2603170131

Remove the "rust_" prefix as the name is part of the uapi, and
userspace expects tracepoints to have the old names.

Link: https://github.com/Rust-for-Linux/linux/issues/1226
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
---
 drivers/android/binder/rust_binder_events.h | 4 ++--
 drivers/android/binder/trace.rs             | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/android/binder/rust_binder_events.h b/drivers/android/binder/rust_binder_events.h
index 8ad785c6b..e3adfb931 100644
--- a/drivers/android/binder/rust_binder_events.h
+++ b/drivers/android/binder/rust_binder_events.h
@@ -15,7 +15,7 @@
 
 #include <linux/tracepoint.h>
 
-TRACE_EVENT(rust_binder_ioctl,
+TRACE_EVENT(binder_ioctl,
 	TP_PROTO(unsigned int cmd, unsigned long arg),
 	TP_ARGS(cmd, arg),
 
@@ -30,7 +30,7 @@ TRACE_EVENT(rust_binder_ioctl,
 	TP_printk("cmd=0x%x arg=0x%lx", __entry->cmd, __entry->arg)
 );
 
-TRACE_EVENT(rust_binder_transaction,
+TRACE_EVENT(binder_transaction,
 	TP_PROTO(bool reply, rust_binder_transaction t, struct task_struct *thread),
 	TP_ARGS(reply, t, thread),
 	TP_STRUCT__entry(
diff --git a/drivers/android/binder/trace.rs b/drivers/android/binder/trace.rs
index 9839901c7..d54b18ab7 100644
--- a/drivers/android/binder/trace.rs
+++ b/drivers/android/binder/trace.rs
@@ -10,8 +10,8 @@
 use kernel::tracepoint::declare_trace;
 
 declare_trace! {
-    unsafe fn rust_binder_ioctl(cmd: c_uint, arg: c_ulong);
-    unsafe fn rust_binder_transaction(reply: bool, t: rust_binder_transaction, thread: *mut task_struct);
+    unsafe fn binder_ioctl(cmd: c_uint, arg: c_ulong);
+    unsafe fn binder_transaction(reply: bool, t: rust_binder_transaction, thread: *mut task_struct);
 }
 
 #[inline]
@@ -22,7 +22,7 @@ fn raw_transaction(t: &Transaction) -> rust_binder_transaction {
 #[inline]
 pub(crate) fn trace_ioctl(cmd: u32, arg: usize) {
     // SAFETY: Always safe to call.
-    unsafe { rust_binder_ioctl(cmd, arg as c_ulong) }
+    unsafe { binder_ioctl(cmd, arg as c_ulong) }
 }
 
 #[inline]
@@ -33,5 +33,5 @@ pub(crate) fn trace_transaction(reply: bool, t: &Transaction, thread: Option<&Ta
     };
     // SAFETY: The raw transaction is valid for the duration of this call. The thread pointer is
     // valid or null.
-    unsafe { rust_binder_transaction(reply, raw_transaction(t), thread) }
+    unsafe { binder_transaction(reply, raw_transaction(t), thread) }
 }

-- 
2.52.0

