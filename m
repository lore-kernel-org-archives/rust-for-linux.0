Received: from outbound.pv.icloud.com (p-west1-cluster2-host8-snip4-10.eps.apple.com [57.103.64.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7F72459E7
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Mar 2026 01:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772933162; cv=none; b=RwoJ3JVUcTQzgiUJe17krjufyZgGNRiy+sAKzywObqbYzcwHEp9KmOwqIn3NJwr0+OH0CnR/W+DCxl1Z1cHq7QUYhm8Y7bXmLq6CMv7ku0mNpAcX+R3YYfT3xo+kccnW9EqB3BmCoBT4SA0SPajLk+xcpiMRlEwXyI2g2SLkBjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772933162; c=relaxed/simple;
	bh=2lDNrix/6JgqqUUUGOJfMZrt3Exx/bNMvx/UEJxjQGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XtK6cpJDEqs8MC+RKv02slnXGFaqiDAM060YRElEJnYWJAgTfHBqMRZItiM6VwqBB4bfkLDeMAHf+z2MCTlkgcL90Kn/kypHPF5SlXJTePBchljdYBj47GS/EzSb6rATjHbPZSnuDc2mb0JFzXD0QjJE6WJiArIg9WI9VNjJ1Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=WJxUOpih; arc=none smtp.client-ip=57.103.64.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="WJxUOpih"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-15 (Postfix) with ESMTPS id 60D13180009C;
	Sun,  8 Mar 2026 01:25:56 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1772933160; x=1775525160; bh=fiN/I4ahZLWYZQLjbE17jqLD4OgjZ+buF9TxmZMk6Qk=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=WJxUOpihffNRIpGTUAAqOzzngmZb9O74QEu9myhId2h0F10DhEAzlg/P45nOm5+DSxhVqoDCTY1mZAmoPLi5LiYRkOibT87zwMVGVjUELso7zUOjCUZHRgPQm5E7izHOQ7Z2OadswEFueGurup8AQVjwhUa+ylFXSI0MO3S123Eu3ptNrZGhhHsQxJ3DeQ+0kESr/2TTcTXOzxNvVrudwKlKibuz8ks/bTxR57V3t6eDJvMzJh4msgPDh3egAWtDMgCa/jjhx6XSEVnYc0kzW15QQHtFEpEPK7bmheLm+Sr9UwIuMsz2IPL6lyZCVa1LbpgK4Z4XdmJ4NVFMlYCgiA==
mail-alias-created-date: 1772007648188
Received: from [127.0.0.1] (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-15 (Postfix) with ESMTPSA id 0D68B180009D;
	Sun,  8 Mar 2026 01:25:51 +0000 (UTC)
From: Mohamad Alsadhan <mo@sdhn.cc>
Date: Sun, 08 Mar 2026 04:24:34 +0300
Subject: [PATCH v2 1/3] rust_binder: remove "rust_" prefix from tracepoints
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260308-rust-binder-trace-v2-1-9e38637a2193@sdhn.cc>
References: <20260308-rust-binder-trace-v2-0-9e38637a2193@sdhn.cc>
In-Reply-To: <20260308-rust-binder-trace-v2-0-9e38637a2193@sdhn.cc>
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
 b=owGbwMvMwCV2WSbwWIGm61bG02pJDJlrLkgHh7Te4NMJvNrb1PX4/2Xjz7f/BJ9e+/5IyjPxm
 M+Pj6rP7ShlYRDjYpAVU2R5ft776MEfN8zOnN97CmYOKxPIEAYuTgGYyOlpjAyT1ScG+Th/i7uz
 j78nRu9G+aZf8my114W+P2JRCr3mbbGK4a/wBKsKrfP9/zskfff1vnu9tsW/d1HibaWIO9OP3PZ
 +uo0HAA==
X-Developer-Key: i=mo@sdhn.cc; a=openpgp;
 fpr=E7CF4BC5C1F8D836CCCFBDCAD31C51C6702945B5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDAxMSBTYWx0ZWRfX28Wvf833dC1A
 lRMQu2/z1z1LecyDPYulk1bPwGpyPtrvF4rSl6lIsrCdiE27eSVlJfuWSYm9MEyyEc0VPV/9IFz
 H9aIjY+IjpGg35WkrdCIEwDmDIVnsxl4hxXknFadZvsP5Mce6pccfNSQ0no02IG3Z5WvRvT3/CF
 E2U8d0qBY0O2BcjKm7PyzW1zBS9fW/sZjkTngpvqZKHvsuU2RtOYKE5AP1T8FOCx0tGf8Pxot71
 UMvwaEs5/3uYDesERVFM8L7irg39yVXcxtTA+U3jka5oyKpctMIbNFLBKrqY8mdtvc4ERs1ognd
 pW0g6wA8+FYgfdguPpEO11CLIbpbQYuYNQuqokwuel5I1091BI46+vnw4PBueo=
X-Authority-Info-Out: v=2.4 cv=PL0COPqC c=1 sm=1 tr=0 ts=69acd025
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10
 a=1oJP67jkp3AA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=1XWaLZrsAAAA:8 a=9KE4tSwBFA36Xu7-v7wA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: JwOowl9hEmu5_oL8NkJRGgWGoArDilxP
X-Proofpoint-ORIG-GUID: JwOowl9hEmu5_oL8NkJRGgWGoArDilxP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_08,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=617
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1030
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2603080011

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

