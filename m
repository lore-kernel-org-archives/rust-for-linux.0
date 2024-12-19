Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE38C1C5CC9;
	Thu, 19 Dec 2024 21:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734642527; cv=none; b=nMW03LlZPZ65VkyaPgPPxcoOzhsAKbP6khZ9XEp89mE2Z+Umy/Zyfn87eVsIxP612CkGnvqtjT8xXqbmuWgbG6nqyji/EgwBI3dF381ddwbLXsMhdSP2cN0cP0/7LxQsGiXzIy947pqx5trW8ap4qW2jDSgZ5JnfpKtUGSDAL7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734642527; c=relaxed/simple;
	bh=AkV6eFg+cDu97OxGU2Wl3OJrwxMNC8s4nUitgc+7UN8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=McS945/PrknaSg3KALsqOjVfO8i1RQl1B/JPBlrIyg5HIO/6V77B+cjTyV5p+kVElXaWUi8SW6abUYhjH7QiMIYDNPpXx/v7b8eoNQmq16LovOl80r8mB1a16paoxp50TV1SsYc0Qyp7WXDr71jB57na/eIXe28sC815tPK2C0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhNnhkzf; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhNnhkzf"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2163dc5155fso11724105ad.0;
        Thu, 19 Dec 2024 13:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734642525; x=1735247325; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R1MhMROjcsA7Jc28Vl9zHVu2WGdgwV5F2CsZPNH8R9E=;
        b=bhNnhkzfoPgn8weZGzuoudGL6xEDN/Iae0h+XLk8YdH83xJWd+HiHmYrXt6mPexHlC
         r+J4PK07gRJAhXiNAgWZ1ob+P1zR7tTi/p1VMgyZ9lGZNGpQcDab4GnTj0gBn//fjzPV
         sSWOKpMk+2OFkfWRpTRgXOtDtrJxsimWftqt2MwIEM6nc2soQLauJ6/2O3sFu3yXZohW
         rAoixqfaUR84uhRefhUlpoH8BGOfy+BaiCidw3JwKFj4/MCTWLhMt3r9jEE9dUVoEw2i
         VE0k/UZWC3o1mTT1vAaDjC7/gDZjEmb+VoRqPG4MahIpSuj5ooubur8aLkM6jaUVVjSJ
         rdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734642525; x=1735247325;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R1MhMROjcsA7Jc28Vl9zHVu2WGdgwV5F2CsZPNH8R9E=;
        b=PI8LKsEs/CI1GGrDJLfH+pRo1yogv7WB8UsnRyXEW6iq4WaJfEthmfzkC9GoD2GVYl
         kN0gCWoYueEx7IwiZunrhPFfMugv00+ER2Lvihbl5p8PIaD+QtZLAM4Yg8uo03WJFm+S
         W3sTXqByftV/HS3OQmJwIc3bW53LaExXzn99LIVlV1uI7LOVAN9gMCelt6JEIzFCLpdQ
         43JYLtQs8Z4jSUCjfERTIRDNTysiUxYWBwv12vU+z9kySoZ6rEgDc4yErTDD8HbS3sYd
         ThUC1RWKY7RHHndDJIWUe7shTuYSITCMYzH7PzFNG/ZIlbWwbaTvzf9fWk88JqZPt0Hq
         Imig==
X-Forwarded-Encrypted: i=1; AJvYcCV397wuptHaUEl3xQ1S1BRmCcRDm4fKoqVzA+qsvh7b6CsFt9KPrSJx2ck1xRzQKdHUjK/4cONGF+z5U+bO/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAh9cObVgasEZsIa5GVhfr2r0d5b1qCKU6731BQerC2WzdFFVe
	wvR5u3EdTZJRS+oShEKlkzY0+xAlaTQzD36VL/BIrFFUIn3xGUhR
X-Gm-Gg: ASbGncsxfvJr+3hY3tg547OPkqKBbITKdo2b+uN/ZUT4cjwbWS8RsSMkY19m4HLcvFW
	ajQv4jtc50fWayYuqQdTf34duDu9LZptAgSR66OVIIxerEuUSJDsZekG/xJj2HoiWfROpIS5sNy
	glypi5zyAzwWkSRf7FOoLXFqyXwOMaRgn9MOwW4HtfjzC10HYIVVZm62JK4IeFeDUPbxXK9E9ox
	paCRVy+fkNOnxloYToXivfcEXDVQj+c+lvMfYL7QqkOuI9v2LEXp4ooZQLOBREJKA==
X-Google-Smtp-Source: AGHT+IE8GygFZK2sr4giHtblhflzh5vPhhJiukJzG2Z6JgvItycKwayoh0hhUg6QYmk5pzEKoPn9jw==
X-Received: by 2002:a17:902:d582:b0:216:5e6e:68ca with SMTP id d9443c01a7336-219e6f26685mr3011085ad.49.1734642525040;
        Thu, 19 Dec 2024 13:08:45 -0800 (PST)
Received: from mitchelllevy. ([174.127.224.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962cc3sm16831755ad.28.2024.12.19.13.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 13:08:44 -0800 (PST)
From: Mitchell Levy <levymitchell0@gmail.com>
Subject: [PATCH RFC 0/3] rust: Add Per-CPU Variable API
Date: Thu, 19 Dec 2024 13:08:25 -0800
Message-Id: <20241219-rust-percpu-v1-0-209117e822b1@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEmLZGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDC0Nj3aLS4hLdgtSi5IJS3dREozRTkyTTlERjYyWgjoKi1LTMCrBp0Up
 Bbs5KsbW1AF18I6xiAAAA
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Andrew Morton <akpm@linux-foundation.org>, 
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Christoph Lameter <cl@linux.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-mm@kvack.org, Mitchell Levy <levymitchell0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734642524; l=2462;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=AkV6eFg+cDu97OxGU2Wl3OJrwxMNC8s4nUitgc+7UN8=;
 b=OTMUfRXX2rfTnhPVl12wpkjmAwrzPGZ+W0l9f787UHmkIGMCZ24WPvarSKbSCWVrpcsQsFvbb
 crEiT2plwJSBEBL0uaIrRQoQZZZcFIuvt/jZ1boRebrVM1E6ZAoLsJf
X-Developer-Key: i=levymitchell0@gmail.com; a=ed25519;
 pk=n6kBmUnb+UNmjVkTnDwrLwTJAEKUfs2e8E+MFPZI93E=

This series adds an API for declaring an using per-CPU variables from
Rust, and it also adds support for Rust access to C per-CPU variables
(subject to some soundness requirements). It also adds a small test
module, lib/percpu_test_rust.rs, in the vein of lib/percpu_test.c.

---
I am sending this patch as an RFC to gather feedback on the API as well
as get some input on correctness. In particular, the unsafe getter macro
is somewhat cumbersome, though its safety requirements for pure-Rust
code aren't too difficult to verify (interoperation with C code is
certainly much more tricky).

It was suggested that I base my implementation on Rust's thread-local
storage API. However, this API requires that for a thread-local T, any
particular usage must be via a &T. Thus, many times it is required that
thread-local variables be in the form RefCell<T> or Cell<T>. This has
some pretty severe disadvantages in the context of per-CPU variables.
Namely, RefCell<T> may panic if .borrow_mut is called multiple times at
different points in the call stack. This is similar to the problem
inherent in my current implementation (that is, unsafe_get_per_cpu_ref
must be used carefully so as to not create aliasing mut references), but
this implementation flags this potential problem via an unsafe block and
the resulting PerCpuRef can be easily passed along and used fairly
easily. Cell<T> on the other hand requires a copy any time the
underlying value is used, which is entirely avoided here.

Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>

---
Mitchell Levy (3):
      rust: percpu: introduce a rust API for per-CPU variables
      rust: rust-analyzer: add lib to dirs searched for crates
      rust: percpu: add a rust per-CPU variable test

 lib/Kconfig.debug                 |   9 +++
 lib/Makefile                      |   1 +
 lib/percpu_test_rust.rs           |  65 +++++++++++++++
 rust/helpers/helpers.c            |   1 +
 rust/helpers/preempt.c            |  14 ++++
 rust/kernel/lib.rs                |   3 +
 rust/kernel/percpu.rs             | 161 ++++++++++++++++++++++++++++++++++++++
 rust/kernel/percpu/cpu_guard.rs   |  29 +++++++
 scripts/generate_rust_analyzer.py |   2 +-
 9 files changed, 284 insertions(+), 1 deletion(-)
---
base-commit: 0c5928deada15a8d075516e6e0d9ee19011bb000
change-id: 20240813-rust-percpu-ea2f54b5da33

Best regards,
-- 
Mitchell Levy <levymitchell0@gmail.com>

