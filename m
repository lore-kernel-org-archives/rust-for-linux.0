Received: from outbound.pv.icloud.com (p-west1-cluster6-host4-snip4-2.eps.apple.com [57.103.67.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820B33E8697
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 14:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.67.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759030; cv=none; b=daxgnKiImNcxd0gXI5wsHCCgQyEtaMm72nDWA24hn0CBPqThfFnMk/lInVhnFPDpP3diBAlBpPd+V0JXsT2j94z8MVewMtF8AMPZtu1gzEU6iAYpB8vXStjx6yFb04cI4sMXrWH+CBh591gfM5TYrVNH4bQA2cA+KHxepJ1aUhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759030; c=relaxed/simple;
	bh=iCd9xQ8byN7xa1LukoJWNMW0Yl6pCDonH61CQFQ6728=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A+sNWvWiP2aK2/eJE0cLhzCgKl0r3GsRlDiOMyMBGJThbtSPj/WUu4MsA/UylCOiglPyJYy4NgfEldPAbfNXnc39NYCWIv1ZS70G9Zxd/dwWyZxJ+w1ng2byZJoQtp8QAoS1F7dvtYElQjIKDBtgAkxYn3nBrwPZBlV5foPAbcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=g6fuR2NJ; arc=none smtp.client-ip=57.103.67.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="g6fuR2NJ"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-4 (Postfix) with ESMTPS id 1B14C1800124;
	Tue, 17 Mar 2026 14:50:21 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1773759029; x=1776351029; bh=+a8oTW2ZYIRofrdUPBjh04w02SW1/OBL4k352l+t8sk=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=g6fuR2NJUBrg3XDQJ/MPC2rzY75mT5dWmA4YTNctALclj+iEiba0A2cuDwLq9tFlOPsdZSMOzQYaDBo8dBtqdDutsVHFL+RNXHg8yiVWp1Xs6AB5ClWRFAIn8V6O74FOdcHO0vnjFm3WQbd6QtRnmpE9DIEzmemQNNY0HTMGznPMAy/G/pARBakLFXmb+heLbfMbDxDw1n4yr3JxrUUuG+iGW8QOk8XkXFC+Tfh+0ENLCvAjI9wQWeDl9m8pg85qPsDN/iTe517pkvJQudRDOHIvNTaO5UHRq6xKsdB0SFrvPsH6/b9XjxkHpDLcKEAxbNghhHCo+koQB4IQpqUBOQ==
mail-alias-created-date: 1772007648188
Received: from [127.0.0.1] (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-4 (Postfix) with ESMTPSA id 1B9AB180011A;
	Tue, 17 Mar 2026 14:50:16 +0000 (UTC)
From: Mohamad Alsadhan <mo@sdhn.cc>
Date: Tue, 17 Mar 2026 17:49:45 +0300
Subject: [PATCH v3 4/6] rust_binder: add `transaction_received` tracepoint
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rust-binder-trace-v3-4-6fae4fbcf637@sdhn.cc>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2795; i=mo@sdhn.cc;
 h=from:subject:message-id; bh=iCd9xQ8byN7xa1LukoJWNMW0Yl6pCDonH61CQFQ6728=;
 b=owGbwMvMwCV2WSbwWIGm61bG02pJDJk7s8REPaK23lhx49q0mr0bAxaaLP63cmHlPp0XG9481
 uI6rzC7v6OUhUGMi0FWTJHl+Xnvowd/3DA7c37vKZg5rEwgQxi4OAVgIh80Gf5X5nVtPvSw7shh
 wR3GjGKVH8XvarL1SjAtcoxRf+YklTeZkeHTl/hv69X2+pzj9Kie7X5oxzYTriT92Nf/u5p6bNs
 Xe7ADAA==
X-Developer-Key: i=mo@sdhn.cc; a=openpgp;
 fpr=E7CF4BC5C1F8D836CCCFBDCAD31C51C6702945B5
X-Proofpoint-GUID: MyQcepXi30fQznIBOVJLRu2-YSgYk0Vi
X-Proofpoint-ORIG-GUID: MyQcepXi30fQznIBOVJLRu2-YSgYk0Vi
X-Authority-Info-Out: v=2.4 cv=dJqrWeZb c=1 sm=1 tr=0 ts=69b96a30
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10
 a=1oJP67jkp3AA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=mH4rWqNsxHqjp7PTL2IA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEzMSBTYWx0ZWRfX3hg1CrjeSDa5
 WgLjZ0PutyXtiVsWYASmmgHz3yks/vomouo6UOvOGqRZSTFcd/xQ6chtkxnp/dL07cv0K1RPhJS
 dxJJYIG0/aw2xbIjF2oK8u7/V2wo0HilRy0vqOuWuQRdaaxFoVdj3AhaFsW57jMwFfwkPbmYEa9
 kzoUc2lmrkOUW8XmOzwBjOWuCwzbfiTiUXpudVc9jOgpf0dOOliAiebf+KdNLGDF7Z7SVoV1QHv
 oOtgS5ulQVRcSTvOLirYgbrp9Q6HJOFyCJd/5aJ8D0zCtKV0/EB3jw1BSlMfKQd6FZmto4OG0+Q
 SUN4C68cX9yetIRjVRTvmxy3EgM2VMiylEj5K8NDBz8eLEwzKjPXJYQ82iZOdg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 mlxlogscore=719 phishscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1030 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2603170131

Add Rust Binder `transaction_received` tracepoint decalaration and
wire in the corresponding trace call when a transaction work item is
accepted for execution.

Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
---
 drivers/android/binder/rust_binder_events.h | 12 ++++++++++++
 drivers/android/binder/trace.rs             |  7 +++++++
 drivers/android/binder/transaction.rs       |  2 ++
 3 files changed, 21 insertions(+)

diff --git a/drivers/android/binder/rust_binder_events.h b/drivers/android/binder/rust_binder_events.h
index 62b587c7c..8a0b72bf0 100644
--- a/drivers/android/binder/rust_binder_events.h
+++ b/drivers/android/binder/rust_binder_events.h
@@ -99,6 +99,18 @@ TRACE_EVENT(binder_transaction,
 		  __entry->reply, __entry->flags, __entry->code)
 );
 
+TRACE_EVENT(binder_transaction_received,
+	TP_PROTO(rust_binder_transaction t),
+	TP_ARGS(t),
+	TP_STRUCT__entry(
+		__field(int, debug_id)
+	),
+	TP_fast_assign(
+		__entry->debug_id = rust_binder_transaction_debug_id(t);
+	),
+	TP_printk("transaction=%d", __entry->debug_id)
+);
+
 #endif /* _RUST_BINDER_TRACE_H */
 
 /* This part must be outside protection */
diff --git a/drivers/android/binder/trace.rs b/drivers/android/binder/trace.rs
index 1f62b2276..d96afdb79 100644
--- a/drivers/android/binder/trace.rs
+++ b/drivers/android/binder/trace.rs
@@ -17,6 +17,7 @@
     unsafe fn binder_write_done(ret: c_int);
     unsafe fn binder_wait_for_work(proc_work: bool, transaction_stack: bool, thread_todo: bool);
     unsafe fn binder_transaction(reply: bool, t: rust_binder_transaction, thread: *mut task_struct);
+    unsafe fn binder_transaction_received(t: rust_binder_transaction);
 }
 
 #[inline]
@@ -70,3 +71,9 @@ pub(crate) fn trace_transaction(reply: bool, t: &Transaction, thread: Option<&Ta
     // valid or null.
     unsafe { binder_transaction(reply, raw_transaction(t), thread) }
 }
+
+#[inline]
+pub(crate) fn trace_transaction_received(t: &Transaction) {
+    // SAFETY: The raw transaction is valid for the duration of this call.
+    unsafe { binder_transaction_received(raw_transaction(t)) }
+}
diff --git a/drivers/android/binder/transaction.rs b/drivers/android/binder/transaction.rs
index 75e6f5fba..c43846bb7 100644
--- a/drivers/android/binder/transaction.rs
+++ b/drivers/android/binder/transaction.rs
@@ -430,6 +430,8 @@ fn do_work(
 
         self.drop_outstanding_txn();
 
+        crate::trace::trace_transaction_received(&self);
+
         // When this is not a reply and not a oneway transaction, update `current_transaction`. If
         // it's a reply, `current_transaction` has already been updated appropriately.
         if self.target_node.is_some() && tr_sec.transaction_data.flags & TF_ONE_WAY == 0 {

-- 
2.52.0

