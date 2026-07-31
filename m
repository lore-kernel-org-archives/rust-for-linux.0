Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FFD5695
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 13:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785504791; cv=none; b=tcnxJajWXkM9INQqF1/bxbPIDv3whP/iCeGIpYN4q44a7xnVEhqZzlIzb7deJXu736VN+Y4I7fbY2vr1/1ThZljBr/GpFmARGOJKisZt3an8DRacu/yN3Sfz6/ozItGMbgm3CUHIEW2lmWa9KhYazsGalFa+77jQajeK2uNwLgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785504791; c=relaxed/simple;
	bh=qtyQqXeu/4yCbAdY5obe8ZDfKJCUl3sEHjOeialVYgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WHtPLfQ99urYGEuqFIw+oP376B633GHx92kHsRhZedk5VTqtLUfLe6ygwkGMIg3DRA3D3v8s5vMlLMIu9YfNcRmbUlJAaoDSfJpZivQJF1JXE82QRTI05CGZUpKEbinaFs41ZWTpoUHSJmIlm57sttGdmZGKiVXZvNnipuRU7sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rcpassos.me; spf=pass smtp.mailfrom=rcpassos.me; dkim=pass (2048-bit key) header.d=rcpassos.me header.i=@rcpassos.me header.b=mhi/tk/Y; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=io9FtRzK; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rcpassos.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rcpassos.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rcpassos.me header.i=@rcpassos.me header.b="mhi/tk/Y";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="io9FtRzK"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=mhi/tk/YzPrnBqUo5vVLcE20dWp2ct2VHtbEq/prgP39hOfQAb1T26eqPIJjHGIQgH/ZeY9kgVWF9UdnPolTT7s46pf3rdrwh++/HD/0H0Q6h/xPgsy6ihBicGkw87FVJ3UMq8Ndts8HEDRNSJEvLLXzUSBQmKuix7sYEtbh1fgdaYSDSfKgplaLfTvDzQA4bm1tjhDeWYJ10kfFSYLbJk79gAPKQlhgAEKdaqh5y4BgUq9KJCivmqt75BaKmnG+Pls5BIXE9AFarGBAQufkWhIQoCbyMFVH0I8cSx6VQN0XPQKzS8fIO9UtvTw5xy5+WKYzlRVRuiwW534uvg8VgA==; s=purelymail1; d=rcpassos.me; v=1; bh=qtyQqXeu/4yCbAdY5obe8ZDfKJCUl3sEHjOeialVYgE=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=io9FtRzKILTQ54/WfQBEIzB9Anv2w6ZOF25pc2khcTmZovTQTvDI8BYphJZz7pUMMviTLPylNPg6WHIr/byECjcp4p0pR/qnNJ1pr8PCrU/RyrOpf1bPL52NacQGYycZpCRhufJoXJDloYeaVhho7I5EMzHhBkKXFxKa5VGddE+X+FWG1VFwL5dCE7wUNI7aF9F74kf9DIhg6cyjtoN2YjEDzVpiSk8Hygeky60H4OR9Iyuj63Uyxj98olZjejyG1D8FOeuq+O5QMg/RJxJQB+x+us9SAO5nwiK4jZmCoxFFmvdJx97aMnZkNrRjAuIzUY9YQbiO8HehzpJM7RmqAg==; s=purelymail1; d=purelymail.com; v=1; bh=qtyQqXeu/4yCbAdY5obe8ZDfKJCUl3sEHjOeialVYgE=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 45355:7809:null:purelymail
X-Pm-Original-To: rust-for-linux@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -217861856;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 31 Jul 2026 13:33:07 +0000 (UTC)
From: Rafael Passos <rafael@rcpassos.me>
To: rust-for-linux@vger.kernel.org,
	aliceryhl@google.com,
	gregkh@linuxfoundation.org,
	arve@android.com,
	tkjos@android.com,
	Christian Brauner <brauner@kernel.org>,
	cmllamas@google.com
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Rafael Passos <rafael@rcpassos.me>
Subject: [PATCH v2] rust_binder: speed up get_node_debug_info using lower_bound iter
Date: Fri, 31 Jul 2026 10:31:03 -0300
Message-ID: <20260731133253.661634-1-rafael@rcpassos.me>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

Finding the next node in the RBTree can be done more efficiently using
the cursor_lower_bound, as it reduces cost from O(n) to O(log n).

Link: https://github.com/Rust-for-Linux/linux/issues/1249
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Rafael Passos <rafael@rcpassos.me>
---

V1: https://lore.kernel.org/rust-for-linux/20260728012249.3084154-1-rafael@=
rcpassos.me/
Changes from V1:
    - remove the "if/else" block checking if the current>prt.
      The cursor_lower_bound function returns the "key" or the next larger.
      This is indeed better, my check was unnecessary.
    - add a comment about this fact before the cursor_lower_bound


It took me a while to get the AOSP + Cuttlefish setup running, and
using the rust binder module. I got it working, and ran:
libhwbinder_benchmark libbinder_benchmark, hwbinderThroughputTest
            libhwbinder_latency and binderThroughputTest benches.
But apparently none of them used the function I touched (I added log).
Also, the "hw" variants like hwbinderThroughputTest kept logging a
 "worker_fx:217 condition:service->isRemote() failed" message.
I decided to send the v2 anyway.

I am thinking about writing a benchmark focused on node scaling
    (test N iterations with X nodes), and run with small and larger Xs.)
Would such a benchmark be welcome here in upstream mainline ?
It would be in either C or Rust (the AOSP ones are in C++).
Would it live under `tools/perf` ?

I looked at the kunit tests (`drivers/android/tests`) and they dont
cover the rust binder either. That's another thing I could try to add.


I'd love some feedback regarding next steps :)
Thanks,
Rafael Passos


 drivers/android/binder/process.rs | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/pro=
cess.rs
index cdd1a90797266..68c9384fbf69f 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1174,11 +1174,10 @@ fn get_node_debug_info(&self, data: UserSlice) -> R=
esult {
=20
         {
             let inner =3D self.inner.lock();
-            for (node_ptr, node) in &inner.nodes {
-                if *node_ptr > ptr {
-                    node.populate_debug_info(&mut out, &inner);
-                    break;
-                }
+            // cursor_lower_bound retrieves the "key" passed or the next e=
xisting larger key
+            if let Some(cursor) =3D inner.nodes.cursor_lower_bound(&(ptr+1=
)){
+                let (_, node) =3D cursor.current();
+                node.populate_debug_info(&mut out, &inner);
             }
         }
=20
--=20
2.53.0

