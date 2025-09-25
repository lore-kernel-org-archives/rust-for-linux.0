Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924B82DCF62
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Sep 2025 13:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758808557; cv=none; b=Wtnl/+4IRRx0m6IQU+x0HmZyiWXbZX7hUl0EXofBPv8Y5WmaWqutWVWqLR2y1ydCxvsvZLMXBHYNdQ58p8wXgXpfzxgiUDG8HPdzedv0af6kI5+ZhPVrBPvFs5VMokulsMfXSBz7KdaVWXGWG409xgSbzgjYzODmCZodh5RqQuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758808557; c=relaxed/simple;
	bh=TE76Xl7EtGwiL3k522JoFNelrGIHYPV5uXDUZx193fk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=btJzMGt4cvs4igt9ZyBv7NtkdXJB6Lr23jMJhmom/UuAOx1il2oljt5aEvaZ4brARlpdkKE2rP1hiULDXGocyxfdxIxEj7fd9CoKv8emXAwDFZeDo9JdtbsBYh7GSTh080crrJiuSJTo7Ny5wyT+J3cBCjN/uxNqwetxpreqvhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJ1QBzQQ; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJ1QBzQQ"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-84ab207c37cso75567985a.2
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Sep 2025 06:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758808555; x=1759413355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbRi9B/DaIaW8U9NAWZIVdIpXCsTnUCErxxV4ovxvuk=;
        b=kJ1QBzQQnod8ikaYW54XssR+CBE3xeOc5hPHb9VMVkm40EXVbG2yI0I4JTy9k7v1V2
         xPJPBZLVEqpXdWn+b+d+yi/VR3bTT3A8qRWqvvbLrlZC0zK4EMU6eQB6ocCdJL+STxG8
         rGtjFKtaxLVHEkxVjFk3hqKNTf53DOdJ/cPB31CF3iu9Bo4Jx7+FJJRXun5NuVDK5R0T
         XEE+P7wWItGg7cidouV0rTIv1sdBr/NZ8eT/ErtQPMdbjvPQ7EMvq41rnAmJkvHTqQpM
         jsXPHNd26pnlqGcpVzITl7z1hZ4Jm5dKwib+hGhygoPE13itEfZhletKi6i6fRZtxWbx
         sGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758808555; x=1759413355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IbRi9B/DaIaW8U9NAWZIVdIpXCsTnUCErxxV4ovxvuk=;
        b=VB91ip4RdGXoAD1oEOwEi6yae6Nb3i3hL1Xs4lCpLlJ9LrFTRMU5HrINspG9fn/nIZ
         afNIp4o9zpKZ4W0Q3vFVmgZsvNmFJj4+fNLqIVa/RyBykaOcR+IsF0HA2cGKqijBBjfb
         EFgsSFsB7DDSlw0n3G84ULO7UL32elngwkizCr0rQ8OU4UYX5iw/Lo1ruVYsa3kD+yBD
         D7wR6F6Sw4n32iRPnLyqgXVLrS5iONFJcDlCJFY2LSpwDqPRftC56Qq5dEJq6EA5PAKo
         8TWEeCUQFvHQRadnOkBGXt5dOfvx0Trqh5gbf0FhGaiOvGJY1hutFG5Ifu2y58oJgszB
         jwNg==
X-Forwarded-Encrypted: i=1; AJvYcCXeXMi/2DCyL/pS0sip1tpaS/aHCcL8AiLnUCAElXqTmlxQHXz+dcd/qC98pd6hKJhIfF/R2A807NqTLfWrBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr56ePD2zhiKozgwN0K9/rCItkwyr6KjGefajMibeQ1pvT4Jq+
	VBNZWk4j+WLP1gE8Ii8Nwv7k+v8ugZOOzDgoJnMiutoIZYGv25mSvyj+
X-Gm-Gg: ASbGnctF99bd0FhO9tH3vWQXJ6a5KQllWkaLjhLH+g0Lj2dAt7EZR2rFAeyQNAXfEG1
	IsEadblsD6ryMxRsRkdmFXTBCXRF9/6mhgYEM4ujkWz7DMfMrNTg38mAHSitptca52/0urmZhwE
	zbzvOfPcXoPbhgRi5A2/ZLvXYexBWywCsE/Nk41jexHJtjz1ncpHO8APDEzyZLEdlHwF4YssocO
	J7yNkkdbHlQzoCyrMvM/4bE62WIaE9cvpdrwrI12y00N32tD8XpgVW0Of/fNIV+jGU0iru/qxMB
	0ewL5d2bIv1vDYe/5wX5pLDwVMeCj9RRQtw8SYqzc3BD4A4jbCdZF6GfWfcOSUPqdhmihfVA6Tg
	J7Y7P+gd2DzmpeBfRgoOawVc+m88jA6xCgjK9SFpCpamct9+d2fheD5nOEAjMOMIulshcNGpxyA
	oq7bwG3HQgfz61ZIz48PW/0FgOI2xjPSFD8/PCNzyHhJyZVg+gR9F18jTQhbQfCIjUURUq
X-Google-Smtp-Source: AGHT+IG7SCiSfqv22MjkqMAx69OdDcsv0d2XWfzHnQ58HqF/5wRLVKKYuW5rQhqneJzNL2eu5F8jIg==
X-Received: by 2002:a05:6214:5198:b0:77f:4415:6d8b with SMTP id 6a1803df08f44-7fc28076ae1mr36287846d6.8.1758808554316;
        Thu, 25 Sep 2025 06:55:54 -0700 (PDT)
Received: from 137.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:7c:b286:dba3:5ba8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-80135968d5esm11536916d6.12.2025.09.25.06.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 06:55:53 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 25 Sep 2025 09:54:04 -0400
Subject: [PATCH v2 16/19] rust: str: replace `kernel::c_str!` with
 C-Strings
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250925-core-cstr-cstrings-v2-16-78e0aaace1cd@gmail.com>
References: <20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com>
In-Reply-To: <20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Jens Axboe <axboe@kernel.dk>, Alexandre Courbot <acourbot@nvidia.com>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1758808438; l=1351;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=TE76Xl7EtGwiL3k522JoFNelrGIHYPV5uXDUZx193fk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNEkH2K217WCJVB+0mC1S+mvJu9BnNI6eCwPt0AKaTiMW7gojiLm71MaiB58vh7llyUCTN8zCSP
 N0RCtgv8pDgg=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/str.rs | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 624386cb07be..4203ce34ce98 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -272,15 +272,14 @@ impl fmt::Display for CStr {
     /// Formats printable ASCII characters, escaping the rest.
     ///
     /// ```
-    /// # use kernel::c_str;
     /// # use kernel::prelude::fmt;
     /// # use kernel::str::CStr;
     /// # use kernel::str::CString;
-    /// let penguin = c_str!("🐧");
+    /// let penguin = c"🐧";
     /// let s = CString::try_from_fmt(fmt!("{penguin}"))?;
     /// assert_eq!(s.to_bytes_with_nul(), "\\xf0\\x9f\\x90\\xa7\0".as_bytes());
     ///
-    /// let ascii = c_str!("so \"cool\"");
+    /// let ascii = c"so \"cool\"";
     /// let s = CString::try_from_fmt(fmt!("{ascii}"))?;
     /// assert_eq!(s.to_bytes_with_nul(), "so \"cool\"\0".as_bytes());
     /// # Ok::<(), kernel::error::Error>(())

-- 
2.51.0

