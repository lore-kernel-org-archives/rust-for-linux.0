Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0329433B970;
	Sun, 11 Jan 2026 12:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768134478; cv=none; b=dGzKDzHBp0bRNoeIoTfwPK5YLYiNxQYmhsTnmPmMirYFKgKHCVIyF8gQ0f40jEWNWs8uIDcRmqFuyZjk1YjdWj7as92mCcYPgxpq8sjeltQyea9ykZ8poJAvZGdUPe5it14pEpyEStJdqficDf2UP0fEl6SC0RI5sM2vqI8v1Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768134478; c=relaxed/simple;
	bh=JTG9j7UbHh0Y+ADlMmQmtrNQM7/JMCXJsDMy+wO7ra0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qGZxAXtWkuLHAaz2rJTopiXI1IlmWUibnzHaQ5At5TTfGqt2w4mQa9Egyubae9wI7PZPirHrx8812458xcziUUkDXnjnfWR9jkSc3Oiysjp5hdsuRSWQNFcvhoompGUrKubBcGZBzavCzVwggZaRAJNpgTA+rleQiblYa0z8/jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aUkFa80K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aUkFa80K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B575C19422;
	Sun, 11 Jan 2026 12:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768134477;
	bh=JTG9j7UbHh0Y+ADlMmQmtrNQM7/JMCXJsDMy+wO7ra0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aUkFa80KIaPyadSvT6hIwv1jL+fRSYIJ8jX8D4EH6qeLzA/jMKZBqTo/3SWrm0epZ
	 2kmWeky8pAHpjXstBXqWgvcYiYzpepXyCpMfNEyRG5tJ/2h4GhgPzR7K2NtoNBNMFL
	 9GCzeS3Nh2fMZGDtluo/ISekrjW4PoleTkPl+XCo5ppIyxBouzSnW/kv4FZjrq/8zC
	 mqQqsNO2E8PCwTqRnI9mQPnYzpU+ChYe+hqpHMQHcQMW7yUVpAYFgkBMSlBKwW+CCa
	 M58JGwKhrrw5zD13wGlKdx0cDcizRa0zUHRd+317hUI+SRRstFOUJYFsW+wqRCY4Qk
	 he2l8krUZsqWA==
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
Subject: [PATCH v2 15/15] MAINTAINERS: add Gary Guo to pin-init
Date: Sun, 11 Jan 2026 13:25:13 +0100
Message-ID: <20260111122554.2662175-16-lossin@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111122554.2662175-1-lossin@kernel.org>
References: <20260111122554.2662175-1-lossin@kernel.org>
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
Changes in v2: none
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

