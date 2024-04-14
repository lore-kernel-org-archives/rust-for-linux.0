Received: from gw.d.sender-sib.com (gw.d.sender-sib.com [77.32.148.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D93E42078
	for <rust-for-linux@vger.kernel.org>; Sun, 14 Apr 2024 13:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.32.148.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713100898; cv=none; b=nrGNSTgF3lF+bXnv00yT2HbXS0S/DlpN7eYERCqmr8T2ye53GFDOAteo7/9V+CIv9lDjPXg1BYmmh+X53xkpYOu1itai7XJWeu91pgcy1p4dwd9JlOS8T0U7lVjXp1BlEZmRoGDZcwoLILH0yTYZNPcI9yEpckRBc4O6i+kUvSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713100898; c=relaxed/simple;
	bh=TD6uMI7QAWgg3XSqO08rarrvGml8Sx7m6ell7wkf6CU=;
	h=Date:Subject:Mime-Version:Message-Id:To:From; b=mVBJ1aeg1EhJG2uy6I4EBNauHXVyOQG2pPBIHA9bOUvgnyMe9GGA+ph+5mj5A/rpfjw133een++ZovtNX+11j0cnB5W7JJ+wIeUit60NfhcGoPI08pj2MC2W1MThctxIdesXh5Huh5iYykjiyAFwTTWSZO/jxEAPmN+x0bZhZfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raxyte.com; spf=pass smtp.mailfrom=gw.d.sender-sib.com; dkim=pass (1024-bit key) header.d=raxyte.com header.i=@raxyte.com header.b=pAaePoZO; arc=none smtp.client-ip=77.32.148.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raxyte.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gw.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raxyte.com header.i=@raxyte.com header.b="pAaePoZO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raxyte.com;
 q=dns/txt; s=mail; bh=CRndFbjNIKMcK8zR6tbvt/PU4cTYUy67e6MOk0bjXFY=;
 h=from:subject:date:to:mime-version:content-transfer-encoding:x-csa-complaints:list-unsubscribe-post;
        b=pAaePoZOskZ9WmQ4QnxPKvkkeS6BJy+KJFQHrN0agCfWt/jKUc2I9adcEsEM32NB+mvU8WW9AVfo
        cmQfP9EOE3cTXI2+HLasz4OpdIZs1hici6RMcc3wuxJk5trW41oy+W4pDzqpXL3GHDZyNNEnE4zt
        NiHMwNO0gJh/HT36XEs=
Received: by smtp-relay.sendinblue.com with ESMTP id eba70259-9b10-4bf7-ac4f-d7accf6b8891; Sun, 14 April 2024 13:20:26 +0000 (UTC)
X-Mailin-EID: MjY2MTUxODYyfnJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZ348MjAyNDA0MTQxMzE5MjguODQ2NjI1LTEtZGV2QHJheHl0ZS5jb20%2Bfmd3LmQuc2VuZGVyLXNpYi5jb20%3D
Date: Sun, 14 Apr 2024 18:49:28 +0530
Subject: [PATCH] rust: update `dbg!()` to format column number
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <eba70259-9b10-4bf7-ac4f-d7accf6b8891@smtp-relay.sendinblue.com>
Origin-messageId: <20240414131928.846625-1-dev@raxyte.com>
To: <ojeda@kernel.org>,<alex.gaynor@gmail.com>,<wedsonaf@gmail.com>,<boqun.feng@gmail.com>,<gary@garyguo.net>,<bjorn3_gh@protonmail.com>,<benno.lossin@proton.me>,<a.hindborg@samsung.com>,<aliceryhl@google.com>,<dev@raxyte.com>,<rust-for-linux@vger.kernel.org>,<linux-kernel@vger.kernel.org>
X-sib-id: PBQn2B5lkUgJCh1TzLqzJhATSBZgXBkTr7nDplb1TJIafW9q6s-F6d7NNgbwtr9g3rBIMcF-p1RXqMGI-S9dmbqJD2dATyNsUc0TPyacmkiIqjlnCSobK5o-2MT6kXVW0Vk09FJA8nczIclMe81gW_2Ird6Sh2KJnOXfhHFDe1or-OkCl8ys1eR44TA
X-CSA-Complaints: csa-complaints@eco.de
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Feedback-ID: 77.32.148.23:7517309_-1:7517309:Sendinblue
From: <dev@raxyte.com>

In Rust 1.76.0, the `dbg!()` macro was updated to also format the column
number. The reason cited was usage of a few characters worth of
horizontal space while allowing direct jumps to the source location. [1]

Link: https://github.com/rust-lang/rust/pull/114962 [1]
Link: https://github.com/Rust-for-Linux/linux/issues/1065

Signed-off-by: Raghav Narang <dev@raxyte.com>
---
 Branch rust-next=20

 rust/kernel/std=5Fvendor.rs | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/std=5Fvendor.rs b/rust/kernel/std=5Fvendor.rs
index 388d6a514..39679a960 100644
--- a/rust/kernel/std=5Fvendor.rs
+++ b/rust/kernel/std=5Fvendor.rs
@@ -146,15 +146,16 @@ macro=5Frules! dbg {
     // `$val` expression could be a block (`{ .. }`), in which case the =
`pr=5Finfo!`
     // will be malformed.
     () =3D> {
-        $crate::pr=5Finfo!(=22[{}:{}]\n=22, ::core::file!(), ::core::line!=
())
+        $crate::pr=5Finfo!(=22[{}:{}:{}]\n=22, ::core::file!(), =
::core::line!(), ::core::column!())
     };
     ($val:expr $(,)=3F) =3D> {
         // Use of `match` here is intentional because it affects the =
lifetimes
         // of temporaries - https://stackoverflow.com/a/48732525/1063961
         match $val {
             tmp =3D> {
-                $crate::pr=5Finfo!(=22[{}:{}] {} =3D {:#=3F}\n=22,
-                    ::core::file!(), ::core::line!(), ::core::stringify!=
($val), &tmp);
+                $crate::pr=5Finfo!(=22[{}:{}:{}] {} =3D {:#=3F}\n=22,
+                    ::core::file!(), ::core::line!(), ::core::column!(),
+                    ::core::stringify!($val), &tmp);
                 tmp
             }
         }

base-commit: 8db31d3f3bd5dbc8cf3a22bba04b4b4add7f984e
--=20
2.44.0


