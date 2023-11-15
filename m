Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R3i9vmMc"
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 836FFC7
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Nov 2023 10:59:26 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-da03390793fso8886776276.3
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Nov 2023 10:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700074765; x=1700679565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JUWHAb3e5dZbBKK0edHWExqoU51hn9qWFmWuJA9GYGw=;
        b=R3i9vmMcQwr+JR6ap62tzeVdBOw80xkxFnrTlsCLYJUdm7nGvrHX7PGQ5Md5mOWnU2
         LRWLe4Hu/L2XzpLIByC+/8b8PJNrxIrLb4B3kWnlzGkjfFvXK58d0uMM1iyfNHthF8B5
         m32C2omiQ5um49FnIyNVENflOhedbOHgU9eBOZYUaC64ZYtkH0KFgz4ZV50MpwFctHlX
         a+fmwjGRzj01dyl6EgBx5nc4UDr0FGIH3lsZjK4azupqgOjq7vsm9Eoszr6HPKk+uDEi
         Jvb+KQuCV36cB0zi/rYRgY93XCBndAKSAVEJgZcXIYlhjnTuqRcf4/hvb6ax5UhDUZzY
         0rog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700074765; x=1700679565;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUWHAb3e5dZbBKK0edHWExqoU51hn9qWFmWuJA9GYGw=;
        b=nCFcrYdNVI9apn9dmXm7j1U4y0Y9BEP6LKF9cEENAPodZFA/4afK/dzIsWOFpJa66J
         WOTuvTK2Gr+z3IT6IhZqkdg8iGtiC2ea8909DB4mJtgGU1w+gYEKLI2JoEOmxKtwMsH4
         0Z3FPRrJddi78J400XjZOsyISYTQjmE4bVPquj8BC0xfWZzj9jWtNhogn7rWDizLMVGr
         24ZkWoIo/8/cklgvRrkbRewVQGwHBxehHhf1IgHS6P030w+30k31y6mAxyOr2CN8Kptt
         UL9am+Y+80a+kZtladc4upvje6PbMHf/qJEStYSIzxpsFhJ3cyEdBtcAtrt8DVTZq5cm
         o6Fg==
X-Gm-Message-State: AOJu0YwIf+tTV1LrvWKOvp9U6dkYxWkzggmDoRYbn+zDR5p+AQWMaSyU
	UzEudqFhjGAYEotMZFc8YuCLnNYB0lrS
X-Google-Smtp-Source: AGHT+IGjpsNx6SrjChuAbVJjKNcAm85FgQMZJLNymEFT3qQCVrDSn8W2M23RlkLVyha63714nCaELKN5KSNs
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:9e0e:0:b0:d9a:5b63:a682 with SMTP id
 m14-20020a259e0e000000b00d9a5b63a682mr347854ybq.13.1700074765777; Wed, 15 Nov
 2023 10:59:25 -0800 (PST)
Date: Wed, 15 Nov 2023 18:50:08 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.rc0.421.g78406f8d94-goog
Message-ID: <20231115185858.2110875-1-mmaurer@google.com>
Subject: [PATCH 0/3] MODVERSIONS + RUST Redux
From: Matthew Maurer <mmaurer@google.com>
To: gary@garyguo.net, masahiroy@kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Matthew Maurer <mmaurer@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Support both MODVERSIONS and RUST by making symbol version information exte=
nsible. This works by having a separate section per field, and allowing ite=
ration to work differently per field. The old module information remains av=
ailable to allow existing kmod tools to continue to work on new modules if =
they are only looking for C information.

This also gives us the ability to attach additional information to symbol v=
ersioning (e.g. namespacing) should it become necessary in the future witho=
ut breaking backwards compatibility - new sections will be added, but exist=
ing tools will still find all their information and keep the existing forma=
t.

PPC has a hack around removing leading dots in symvers. I have
replicated this hack for the new format, but without context for why
this was being done, I can't test that it works as expected.

This was inspired by Masahiro Yamada's suggestion[1] when discussing the pr=
evious attempt.
Link: https://lore.kernel.org/lkml/CAK7LNATsuszFR7JB5ZkqVS1W=3DhWr9=3DE7bTf=
+MvgJ+NXT3aZNwg@mail.gmail.com/

Matthew Maurer (3):
  export_report.pl: Rehabilitate script
  modpost: Extended modversion support
  export_report: Use new version info format

 arch/powerpc/kernel/module_64.c | 24 +++++++++-
 init/Kconfig                    |  1 -
 kernel/module/internal.h        | 16 ++++++-
 kernel/module/main.c            |  9 +++-
 kernel/module/version.c         | 77 +++++++++++++++++++++++++++++++++
 scripts/export_report.pl        | 17 +++++---
 scripts/mod/modpost.c           | 33 ++++++++++++--
 7 files changed, 161 insertions(+), 16 deletions(-)

--=20
2.43.0.rc0.421.g78406f8d94-goog

