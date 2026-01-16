Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CED3624D9;
	Fri, 16 Jan 2026 10:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768561034; cv=none; b=EksICCvsCou8+k7aasxozQuiPQLubIGoN2IStkQOljLqO4rJbXdNQNr58GyKCEmu9UfeLK7YenLED77ZGIwdirOlQi4QCWjxr3/DiIIkyyTGyBZAL+qcMfOnr6Hiij4npZ8LcPtqJJOAVH76Ny9nCeOuj1FPH+GlmDTOuE3Ty7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768561034; c=relaxed/simple;
	bh=DZPNKFi1bCdtsVKSpjxpLcW13Dhy/4zUvnc2Q9YKxYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q6+TSoUxymGLRT+rEpT2uLzNV8qaxOs+De9/CZO8S0vHo/PQ41BHARI0sGgbVBiaAJrFRlm0adHb8gCXO5J+ePVNqQVhgxoqVr8xUrR9+43nYtDYvERPQHkltlDfjoIdj/J7xKPLeKVI+A7AAzyFYE0405FM5QVIRfB64K01xJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kbsfllZf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kbsfllZf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B51DC19422;
	Fri, 16 Jan 2026 10:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768561033;
	bh=DZPNKFi1bCdtsVKSpjxpLcW13Dhy/4zUvnc2Q9YKxYc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kbsfllZfO82CY6ZukfcBd76q6s8AxfSwnW0zt2Cts9gqTN9eS78n20GRbVho5ztJg
	 7/rOFyJpm+csOAP4vi3TMwOpHLtx2X+r8EK++J18wBTsi25POb6+vE5zEQ79UlIn5G
	 bfdv9mCepvSYwIePBgvql+oDdvEsxFA9nA3to0UDIyiuUfIzQTB7tWU6BPhNarTDG0
	 GTcwHSPgDnS/lF7BPuoGtY9Q5LvNK4+sGD+U3SpfKFCxnRop29wPTioPSWqSpKVu8P
	 E3LMuOQ3SMp7mj+P7aK/3C0X08y/Bc7f9oUbW4s/Vo0qAVFIWPLfHGAqNL7glDRBMT
	 I7tVb2XIiHTxQ==
From: Benno Lossin <lossin@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v4 15/15] MAINTAINERS: add Gary Guo to pin-init
Date: Fri, 16 Jan 2026 11:54:30 +0100
Message-ID: <20260116105514.3794384-16-lossin@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116105514.3794384-1-lossin@kernel.org>
References: <20260116105514.3794384-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gary has been involved in pin-init since the very beginning. He created
his own version before I even joined Rust-for-Linux, contributed ideas
to my solution, and reviewed it. With the removal of the declarative
macro mess, he is also going to be a maintainer of pin-init.

Acked-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dc731d37c8fe..fb6534339b75 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22916,6 +22916,7 @@ F:	rust/kernel/num/
 
 RUST [PIN-INIT]
 M:	Benno Lossin <lossin@kernel.org>
+M:	Gary Guo <gary@garyguo.net>
 L:	rust-for-linux@vger.kernel.org
 S:	Maintained
 W:	https://rust-for-linux.com/pin-init
-- 
2.52.0

