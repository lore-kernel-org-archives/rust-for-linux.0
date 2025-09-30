Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF707D07D
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Sep 2025 11:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759230284; cv=none; b=hMbL8ZJf1Sa/YW/YN7IfDToS/fcZaAwdIBZqcn0TgZC/dmIGDJPY9TvLn4GQVBvJX0TDaK/KU/sEizsi1Y53OM7gCLv8jvf0bJwQPAtCJPX0oI1hftpU+jjkKnA1Fwvj2NtgEA8JT/k3GciKjcKmUMKJDXelbarXQK6BQW7pTCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759230284; c=relaxed/simple;
	bh=rd6r3YZ5CreoOIGPhlv7qZcTbTgQxOS1EYltrH+4Vok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n2XlYWppcZlDBqkFOE12QM7f/WLo7kgwBtphqu5F6wJR31ecvTpHZ1LdEaLy9srCbt1k0BY7SOEeC/gySa14E1qQpMTuwc522bRH6wKYPUiuhpuS3ReptVhKHuA1mGx17UesjtRyXDQ3GJdIM/EuOV0Sxkm1jTqlvVWkBlgnu3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eblLuuX/; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eblLuuX/"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b551350adfaso5475480a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Sep 2025 04:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759230283; x=1759835083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPM9cQm+a2uPRDlRKN6oUV7loYn+iemaYSScmwnHm2U=;
        b=eblLuuX/GahellGoPu7RbL4xOj4Uu2XBrdbde/Bv6Qy3uCBKLJSGEoK98khvYNYsGo
         eBdKMeDYb4TS8t9f+DgJLeUxAY8S0AZzU/98t47TvKEpXCf2lPBDXFk/lZoxNmfjUvii
         PqQd3A0MSHrLe0ZZYBHJVctYTsyVySHoK6VpacoKX4EXRBadWo09ljKBL7jQzsB0eqmH
         eFvAn+qPOm957mOKG/6lhhmBouJwXK2sHyQzoPhC3uKsKzucsUKqHgT46WNBPHkn8eV4
         eEo+nRS90RHqATqmK+30qB9BH2vAo7vHjWdRC/8Z9+iEz6a93fsXprTlghS3O8F0IMol
         XS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759230283; x=1759835083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IPM9cQm+a2uPRDlRKN6oUV7loYn+iemaYSScmwnHm2U=;
        b=I7fH6Syb8ggEzm1tjYjBpFyeRpDuZQmejX7D9TR3JV8ChJZragBEZe50GprM7g9l0f
         YDGlQ36kajy7R8tMALKZTgS405QXoXN6PLwIrivKDqb7kaHy5SO4yi6cRcdoGwohSbS7
         l90qz9c2MGYMXCHtTfx45bPBZEyLoyqykhvfIx9vxCZgmkyc0282zVJ28/rdIWY1oX/0
         Y26K0LddY2PK/+5LApJBx6FnDd2ZfE5X9HBSjN81+Gv3cVA3qxlwhRdh9Gtdp0HaOiUi
         c81ceYRrEQEXX+NngJkUEkWEBbNfkPKtBJaYyqVva7Ul45QgTWzHGgrAqbpTKWo3cut6
         HQFw==
X-Forwarded-Encrypted: i=1; AJvYcCURmn7uCifcvGVXpfXUdnANOaAhxb2n1VliHhLiEEy20lHQWbfZv6+1JdABc/fa9qCuMeQI2U9Jr0Ly3dkYrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZs0IVpk7CqFUf6k8OhtFpGtRCrLvVCGEHa/TLtST5PLG9568i
	Sax3Dh//G4FEH7HvOX2iwLd/xj+5mmXpRlSU6QRDFUwhekrYaj6VaOQd
X-Gm-Gg: ASbGncsmMfcbYzES+oIMy82rNSMpCnZltbD/iKq/vrXvJ7ArQF43WOG7sTyr4F9oyXQ
	1AhjsC5cDZ/gmgoXOluj6D76woXzq/E6V4uaBx1k0fFFl1XNKa6TvR+BoEwpSGT14FnFnvYagAD
	uNVkaLY24NpKAIqlu3DssqZzcZ7MBoLk9cJC53ltAlyN/U3EYFtV4eARnwoA6qPJ/J/R68v4Chk
	yE7R8H3DYAjh61UZmXXx4Ao2xACExyciyuoUBVYqrl8KhRY8Tl9PecnWhPDY4n0bwqwjideGK8U
	OHP1kAbi3QXdHK+zTjVa51rSlkrpC/ZZo1nPWjC9fCH6Nd2/aB2ITC3LoS7r4CUzHE3B1qveUmT
	Ht8aWmxWAxh43lO6Nmi5vbX7xiSVBXs1a31DgmP26+/sUg0sY4hN3CfRU9aqnxQ==
X-Google-Smtp-Source: AGHT+IHzSgoeQhshCVoioYm/kSlIiIPlDW7b2JR6FtckzXalSYNpdGWehRFnw4TklcYXNFKx4nNzww==
X-Received: by 2002:a17:903:2348:b0:275:3ff9:ab88 with SMTP id d9443c01a7336-27ed4a4e174mr220944555ad.49.1759230282147;
        Tue, 30 Sep 2025 04:04:42 -0700 (PDT)
Received: from LAPTOP-1SG6V2T1 ([45.14.71.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66fb07dsm155372575ad.36.2025.09.30.04.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 04:04:41 -0700 (PDT)
From: Tong Li <djfkvcing117@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tong Li <djfkvcing117@gmail.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v2] rust: file: add intra-doc link for 'EBADF'
Date: Tue, 30 Sep 2025 19:02:58 +0800
Message-ID: <20250930110258.23827-1-djfkvcing117@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <CANiq72n+tBB=NasbJr95YJ=HPgSc35uwKALRyHDOyh4nG6xUOA@mail.gmail.com>
References: <CANiq72n+tBB=NasbJr95YJ=HPgSc35uwKALRyHDOyh4nG6xUOA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The `BadFdError` doc comment mentions the `EBADF` constant but does
not currently provide a navigation target for readers of the
generated docs. Turning the references into intra-doc links matches
the rest of the module and makes the documentation easier to
explore.

Suggested-by: Onur Özkan <work@onurozkan.dev>
Link: https://github.com/Rust-for-Linux/linux/issues/1186
Signed-off-by: Tong Li <djfkvcing117@gmail.com>
---
 rust/kernel/fs/file.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
index 67a3654f0fd3..f3153f4c8560 100644
--- a/rust/kernel/fs/file.rs
+++ b/rust/kernel/fs/file.rs
@@ -448,9 +448,9 @@ fn drop(&mut self) {
     }
 }
 
-/// Represents the `EBADF` error code.
+/// Represents the [`EBADF`] error code.
 ///
-/// Used for methods that can only fail with `EBADF`.
+/// Used for methods that can only fail with [`EBADF`].
 #[derive(Copy, Clone, Eq, PartialEq)]
 pub struct BadFdError;
 
-- 
2.51.0

