Received: from outbound.mr.icloud.com (p-west2-cluster4-host6-snip4-10.eps.apple.com [57.103.69.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E99D366801
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Mar 2026 05:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.69.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772862159; cv=none; b=WOi7ZMOuyAP5K/q/SChpIc/QQt78tRM+s7zh4n0+WpO9OUcbyI1ssWe5jjEEu3oEOvbr0TzLS3Y9IwcqyBRisxqfnnqP4WJsTgMiQ3O8HpyHIwdW7xzezWTFhqgd458fvoZchnplPOZDdI73A00vWzMRQ3wGB6+pkJIevkOt2u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772862159; c=relaxed/simple;
	bh=2lDNrix/6JgqqUUUGOJfMZrt3Exx/bNMvx/UEJxjQGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VbHaQvw9iVamzJqzUc0x7L8KJ3T0J6gQUwJtZOHDnpMRbnSLScva2Ef+AmclMnfF+qWyixpXoyLRXp1boSHxkUmosbA30TQsaOfXe9C1eh0r5IJTFlL9XpIuCZS8dkzDdzISQQNv53DTh3pclhWz2PaScUyzCFiJGDrxccwjqTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=08zzfsaQ; arc=none smtp.client-ip=57.103.69.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="08zzfsaQ"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-9 (Postfix) with ESMTPS id 7B5F81800170;
	Sat,  7 Mar 2026 05:42:33 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1772862157; x=1775454157; bh=fiN/I4ahZLWYZQLjbE17jqLD4OgjZ+buF9TxmZMk6Qk=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=08zzfsaQMQgDXLHaGnJb2IyJMKTJhBbY6l9gEva52Fr1Z99DJW6nB1Kjq3r+Og3vsh6YMmx77B5/HPKR3UNB5f1bL4VRaeNQUJnLbQSjzBieFGlyibLaN0fUE4eOaAhqgNsfS7YOIqvNxmm9Ji18yq5AjaYLZi2V875PrEGG9dE1X9MGNnehKyGckPYLxnZGyTDViW1YJAcJduP4TPjigF+5EIBpwmaC/RYO7lYzVAjFLFijoUPY54pgEfIUeHTqRVyRPLQd1lW4cW/i3UTnWiIezytPsDqMl7H4jksp01+W/UjLuZe6bebhqYH3wNhYn58Bb8eQSAq8WZAsMthwkQ==
mail-alias-created-date: 1772007648188
Received: from [127.0.0.1] (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-9 (Postfix) with ESMTPSA id AFD611800173;
	Sat,  7 Mar 2026 05:42:28 +0000 (UTC)
From: Mohamad Alsadhan <mo@sdhn.cc>
Date: Sat, 07 Mar 2026 08:41:21 +0300
Subject: [PATCH 1/3] rust_binder: remove "rust_" prefix from tracepoints
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-rust-binder-trace-v1-1-5e03283c6e53@sdhn.cc>
References: <20260307-rust-binder-trace-v1-0-5e03283c6e53@sdhn.cc>
In-Reply-To: <20260307-rust-binder-trace-v1-0-5e03283c6e53@sdhn.cc>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2539; i=mo@sdhn.cc;
 h=from:subject:message-id; bh=2lDNrix/6JgqqUUUGOJfMZrt3Exx/bNMvx/UEJxjQGU=;
 b=owGbwMvMwCV2WSbwWIGm61bG02pJDJmrd+2Pyso8tkmza+oz4TPnV6o9Z3p8Sa+1+82SnviI8
 n6njRf6OkpZGMS4GGTFFFmen/c+evDHDbMz5/eegpnDygQyhIGLUwAmsl+AkWFq+MdFhbMXfThf
 JJXxxyU9Z6XoPtb03trXsreOrFC5nFvK8D8vSUROpz3jUr/FMp+13or/jVzZFh3fKyAQnSx6I3Z
 GMS8A
X-Developer-Key: i=mo@sdhn.cc; a=openpgp;
 fpr=E7CF4BC5C1F8D836CCCFBDCAD31C51C6702945B5
X-Proofpoint-ORIG-GUID: _IFr-nc6q5oFYn2KgboNZh0QekS1KK5X
X-Authority-Info-Out: v=2.4 cv=ROO+3oi+ c=1 sm=1 tr=0 ts=69abbacb
 cx=c_apl:c_pps:t_out a=9OgfyREA4BUYbbCgc0Y0oA==:117
 a=9OgfyREA4BUYbbCgc0Y0oA==:17 a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10
 a=1oJP67jkp3AA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=1XWaLZrsAAAA:8 a=9KE4tSwBFA36Xu7-v7wA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDA0OSBTYWx0ZWRfX22KojlkjMuIN
 CQnDDm2dQ8BZqRqU/2/W+gIH9EM1bWForI0RXFr34GUfy81JzxLi3twfJ0qn5VtodS74+pOwUje
 Xrwa+W1tVgedTGh2ji/kN7lAkiSa0w252NF1613WZmDGw42mSVUkHbpRWFSapEWcnDdi/GjGYOc
 z+PInF137+ldqUm/FqW7IC1lE+akHgh2+gZ+8ySk5AiGof17JHeaGIsiA+p3HzZQ0DRBmAWo+AU
 1b0YbXtfYSWu2A5HoyTNY1dH5o8XwEFq4VPt1CbvkutgPXkOXkcQJyaOgtYWA/yl6UxJLR8er9q
 OGQrJ7wdPm9IK//y4hhgVZbrqCz8anOaEAZTNhuGEFDuF3x6VAJicljb16kZ64=
X-Proofpoint-GUID: _IFr-nc6q5oFYn2KgboNZh0QekS1KK5X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=617
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1030 malwarescore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2603070049
X-JNJ: AAAAAAABJTnPiA3HSzYp1ZeGcorkh7l09qiGNnwMvmnC3fStQNBviAzSIEzHktHqbqCjl5X2e3RYvD5WmPRvO2V9ijTGQE9zZAoPw28iRHI6QTr8nveHaHNsdX2oQQeMtMldrBZZrdYqxxmgb8bIzdT4cwTpwPeNZOvG02MxfOBQL/Aig/aQvuqRqImE+r/RKFzdpBHA0l06MxqevuKwA5eykKFz1vf7pKsBdcxYTvtV91nHHdylKN+D7tw7u2f7ZGLsQlE4VzzfcpgpREqvFYwC/JHFMEQlSKuMKGLZ5+N2TQG6Awoj1kPMByOZD1l7LScAz2NVec1I87uaFYLCXQDHA5oREgnDT49C8fDnpkhKF5OOdkPOTvh9Pyr9Xd26J1VX+T8O5sWUjd5uZbc+msSgtFIi8phOJfxZqrylCsz2GJTuO7kknMorQ7dmjoUG/8+mKAqRqTqg0SLDgPlVdOjPQBp2koJz7S+dcQ0M9Q2HhicZJ0KW5bSnAHqnrwpn736G8pUcJ+xTtohjAQ22PIli+5aQplHBKccjw+HCLzQDjQiNvUfgD39qRPn0PION+QsxwabbMM3ikYnbiPRsKIBWOAoDOek030atJvZZd1iRLgIJlIjHRyEtCrMbsiiOK+7JTqtE3cGEif7KmFiaPuZocdsLiq0kXbON3VZMHkjG9MwdG6Nqu2NBZgwq5+sGJIMWq7tj0cTP2wWEo6jNiUI5hYOlNHJyZQ8NpjRdN0OX24/RMzGfPGAr/XU1D3Vqg66RzEKHHPNVFxNmF7VEAO9h87AVtdQ0fH/mlgp4G0TUcFfth/HQriEhxb96AQ==

Remove the "rust_" prefix as the name is part of the uapi, and
userspace expects tracepoints to have the old names.

Link: https://github.com/Rust-for-Linux/linux/issues/1226
Suggested-by: Alice Ryhl <aliceryhl@google.com>
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

