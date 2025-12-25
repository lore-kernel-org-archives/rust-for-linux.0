Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4385622B584
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Dec 2025 22:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766703439; cv=none; b=iohOtGeTBhKUBbXYpeHvh2db1NnoQ0bapEiYxDQA1uFMEp1CfTljJgtoqf1K6AJk8aEOMHWFXusYr8ibJO4A1Ab4uiwiwow92xgxu5Ba9XD7Z06HtN+Xil3cRRLEUxrjiSGZeW0DLL8YgVLvbXWcJfTOm840GAPRBHJqVxHii0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766703439; c=relaxed/simple;
	bh=Gg4Q38JFH17LeRceMnk3YeK9Lz+unIJKhJvGXGz+Xuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BHhc0Em0PKLk/dLnO9y2CQvgQG0toLswUPfY9I/kbr+eIEFBj0iaLWoB4peOTNzVgUe+iODQsR6mtisKViTEx3vF5FBWrY2Icim9kxICKW72kZ4L2QxDdVEK9uO77SVRFxt20Y0oZdfZEkc+6dhPDJzP9T+6aSh9QW96H6Jbd2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a110548cdeso94980365ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Dec 2025 14:57:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766703436; x=1767308236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EbJBebD/mciJulbjdKkrbDIX1SsYhy2E4+YWtz0TnI=;
        b=BeWKnM63Ie9Z+51M+SOVRD+xKfzV3XTvNOIt1Q4Lb+gTkbyf+SSXxu3KeaRb4+my+S
         OVd7Fl33zA3C34eLqzJfbhWi/q75+HKMSlVJz46aB5Tw3g+qyqpttvxECb/uw46IQjzP
         7moLpt4gF5E86BxHRHfgpxypb++jDZl9yq+m9DTj4LliVPwdh5q+nYgxnGl/2YELAyyb
         xVeDmPgcIRIUyROgmGbbG77pMSa+aWwrw6QmY4Wu2+s1v0rbJXLYh4u/GiHwOY90XmfT
         fK1cOGly7wMYKa8I616qirV70h4n9yO8RaXG1XfeiVudZKUvEJheJVlGOmu4s6dxdY5O
         j8Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVrWObbnbTNV3U5gWmgocywQqb9aLRsJM3M5+izUPyTCopLMGOS3g0gl75zTVyrRysMufFIeWD2lCxP5aSUVw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Z0HXXhgPCF2shllSepvsXXT98a6yrq4Igu3HXNxxr7VXDQUW
	zzt2EoeBzo7NTXpvz6oznMClzPrfbJrFhZfkJybW1/YnQxv3sh1aP6DU
X-Gm-Gg: AY/fxX6ZxATkzvIhlriGgfwwtxHI3Uxc3CYhHFc4ghQVKVgqAC74Wq2jnPBz9N9UMmi
	25SJTSfuJc1bP02TwYuDJ/Jv5l3IuyoUAIJ/lD//X8NE2hJnMVhiXqP3SeAuRcd+d6Oju53gJRN
	u4/ydH9oQdWvw/gWnIl5e4tyHfGo6bguIsi52KkXY+/l7V8VpAMpfmisqWIbPA5rZX0BXhC9WSQ
	Dhlc9W7qdTiWGQucuWXdZvKvKhgXUFJKrMUeWSESLSuJ5gXLgpRIdwSeKEYqlqS9XkBFRXHw7wT
	IQtceB5NHZfowCKu2JcwToklM24kRiQ14JKmk1tDNiD1I5r/m/CiuTX0f2jEcvhDLzN3Iqf54V0
	w9HTljw0HYbYDgseJm3xxy8MsUxkpVjGeE+7MMjCFiMr/SWrBO4QuzmA8OF2ZcfeuS2kMxfUzt6
	eNQlb0HXMxH/l8gWlGEvg=
X-Google-Smtp-Source: AGHT+IGM0sGhZEsgW3Hk+AkRui0JtgmmuZ+1e8B5L8c9Ot5gn0I3kjz6ERNq1aynFysxmVv9TnMshg==
X-Received: by 2002:a17:903:40cb:b0:29d:6b8e:d565 with SMTP id d9443c01a7336-2a2f283116emr200839105ad.38.1766703436376;
        Thu, 25 Dec 2025 14:57:16 -0800 (PST)
Received: from localhost.localdomain ([103.56.52.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c9c0acsm187308755ad.44.2025.12.25.14.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 14:57:15 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Dirk Behme <dirk.behme@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Timur Tabi <ttabi@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v4 0/4] rust: Add safe pointer formatting support
Date: Fri, 26 Dec 2025 06:57:03 +0800
Message-ID: <20251225225709.3944255-1-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds safe pointer formatting support for Rust kernel code,
providing three pointer wrapper types (HashedPtr, RestrictedPtr, RawPtr) that
correspond to C kernel's printk format specifiers %p, %pK, and %px.

The implementation ensures that raw pointers are automatically hashed when
formatted with {:p}, providing safe default behavior that prevents information
leaks about kernel memory layout. Users can also explicitly use wrapper types
when they need specific formatting behavior.

---
v4:
- Use Pointer::fmt() instead of write!(f, "{:p}", ...) to preserve formatting
  options (width, alignment, padding characters)
- Improve code structure: reduce unsafe block scope, use early return pattern
- Add doctests with formatting option tests for all pointer wrapper types
- Enhance documentation with detailed formatting options section, including
  examples for width, alignment, and padding
- Fix RestrictedPtr example to use pr_info! instead of seq_print! in docs

v3: https://lore.kernel.org/rust-for-linux/20251224081315.729684-1-sunke@kylinos.cn/
- Export ptr_to_hashval() from lib/vsprintf.c for Rust pointer hashing
- Add three pointer wrapper types (HashedPtr, RestrictedPtr, RawPtr) in
  rust/kernel/ptr.rs corresponding to %p, %pK, and %px
- Make raw pointers automatically use HashedPtr when formatted with {:p}
- Add documentation for pointer wrapper types

v2: https://lore.kernel.org/rust-for-linux/20251223033018.2814732-1-sunke@kylinos.cn/
- Disabled {:p} raw pointer printing by default to prevent accidental
  information leaks

v1: https://lore.kernel.org/rust-for-linux/20251218032709.2184890-1-sunke@kylinos.cn/
- Initial implementation that directly printed raw pointers
---

Ke Sun (4):
  lib/vsprintf: Export ptr_to_hashval for Rust use
  rust: kernel: Add pointer wrapper types for safe pointer formatting
  rust: fmt: Default raw pointer formatting to HashedPtr
  docs: rust: Add pointer formatting documentation

 Documentation/rust/index.rst              |   1 +
 Documentation/rust/pointer-formatting.rst | 101 ++++++++++
 lib/vsprintf.c                            |   1 +
 rust/helpers/fmt.c                        |  61 ++++++
 rust/helpers/helpers.c                    |   3 +-
 rust/kernel/fmt.rs                        |  60 +++++-
 rust/kernel/ptr.rs                        | 215 ++++++++++++++++++++++
 7 files changed, 440 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/rust/pointer-formatting.rst
 create mode 100644 rust/helpers/fmt.c

base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
-- 
2.43.0

