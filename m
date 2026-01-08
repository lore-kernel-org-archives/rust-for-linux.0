Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9D44A1583;
	Thu,  8 Jan 2026 13:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880421; cv=none; b=OTa+p1vcaIbudb2Y4pMp88hBEqWxxIuS6ZmmkQvawOhunxtwmb7DoRuaahqDsSCaf9x/8aiub/UqP8YzxW0RAreY2ZfIvVrpHBUX8xGrpUSQ/oK20RMxNx2jH/3SwZcHpZKNtbmBtAqAxNaedHf/BmjPRezaCewm1mufLhlZo1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880421; c=relaxed/simple;
	bh=n1TOtkvhO6+E53eScgAZDM8tntkQ8tIpB7iBVPGyURQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VzY8dlJYVX8fecH9eZc4UpX96o9LJmKltWkFBbmMei6aAIt3Hu1yzjOSGqpUMT6XyLDR+obYc6E0M07JkI0plFNwhWtAY6/SJUAWb2WVQPMSc910cBYmAhKDcIploSfS8oi/nAXtwIyet+PkKgZ4owZUykDJgRG3yvI0yAiCMIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hUJeYlF9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hUJeYlF9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25FF4C116C6;
	Thu,  8 Jan 2026 13:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767880421;
	bh=n1TOtkvhO6+E53eScgAZDM8tntkQ8tIpB7iBVPGyURQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hUJeYlF9dgKiHGP/pd49DVBz09n9S0y+sBJdMss6DpGfgjCrxuMWTwp00Jy4yV+Bb
	 saL9kDEQDdig7/ENjn4J8X8PqLoULccOPxucYHXVdXg8Q7H3d7dTkIXNsJR5Yj94P4
	 I0+SeEYpQEl7wCG7TZq3XGLVZCviiIq7Fl5GQIdSuaO5tebf+WuOSTlcuN4I02qFoq
	 4ePvij98I7k90y+TPOyN5SIQuIpXZjIypXi/tYqHRJ3c78e4CLsh9zpR5ewCUIFRBo
	 dav0LYYpYmIZnQ1H/asycgf5d9ygyF3xxmiX9Mebi1i8UJ9/5/PkbyDYf08YciHLUn
	 u+lFVybIFyKVA==
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
Subject: [PATCH 13/13] MAINTAINERS: add Gary Guo to pin-init
Date: Thu,  8 Jan 2026 14:50:51 +0100
Message-ID: <20260108135127.3153925-14-lossin@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260108135127.3153925-1-lossin@kernel.org>
References: <20260108135127.3153925-1-lossin@kernel.org>
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
2.51.2

