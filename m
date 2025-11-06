Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DACE3277A4
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Nov 2025 12:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762430956; cv=none; b=ZxtdwHfhQvvD2Z0Z/iaVqf13YnIi/pRuxPlsXTDAarFxw+cagHBCo6hekJS1vV/D+F1J1xpefEIPBpWFHOSWocs1Bb8svQFGpworBrnDonQEVwPv1Wd24hE60sqR6mtL/dTYl72UeaH/0tflxnm1xIM3a61GSeVbHMSfFf0mc+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762430956; c=relaxed/simple;
	bh=v8C8yVAE9Ny+v9yDr6VsXp9BWcYD+xa4DF1KLCBpzIs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Dadu2dBkTu3URnd2o4S/eqKF+MyZmQz3AxNvrQ42SSLy6PZiEjxzRbIXfVDBATWxgZyzmxYfbaVCxWAsHxEs+tRxvjF87LIi5qTRyy05DjJbOfVdULUmjH/1o5vL+xlfY2qtE0IMw3qskOm6nP7x86idgHH2nM1GnMKWaV8Igoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q7j5ya5I; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q7j5ya5I"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47740c1442dso6755265e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Nov 2025 04:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762430951; x=1763035751; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oMi8GYYBlVguXP2AF0cTsK9jLp8lS1meVWWIEbSlshI=;
        b=Q7j5ya5IB0x/pr6ng9pNDPxd3spxe/lmh84QGr5w7rtlpjU2jSoOD016wYX40DuBFC
         tzhA1EUkfiZfQ0e2sO/rzgWxvQly7KRt1V29XvwnpohhMJibpgRIXnBbdGIks+Rq8y3O
         yV5ue0smcC3ckSdyj/fKrzffP3HoCTXxFNKv94UXa7Xe/GOpJFkbnHb1bbWh3zhw5VFE
         h4z2uwZsRJXMv1f9YmIDU7ty1ADHWubMcDVrKmXvzwnybAxO/wsrYd87dSXd2yyVpBmc
         EH1s0/gsTDUUWQ3daeFZKnj+hpPWDbSpwra1+31SNvEN+bbDKE6NxakDhRkaBQJOhYL/
         zXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762430951; x=1763035751;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oMi8GYYBlVguXP2AF0cTsK9jLp8lS1meVWWIEbSlshI=;
        b=IjzoWtHkzpqMxi2E+S47uk7SDXfBz/nY7WDk1sViNbjuAvEWtlCzF4wMjPuP6K1Jg2
         36xVY6GN2SPr5GjGXik5JefkCVNTDFghGQ8lyLggXUBG4qnXtGu3LrRZ3xHIyNTx3YGr
         SbBNCAATfwYOkuS1CQCgMGtG7wwwFeTO/YyOdz7G6bxuDb9tJSQ5UKyVZy3pEGbyzadN
         2mM5Nsn9PhHeZYdVGLhNpCY67YAqrdYixXl8I+H3NyLqh+aVQ9r8zdUJAelfLfYd9Q4q
         YFrGE5Mbtt/mZ8IsmZvv3KvB+IBeCq96epJm3wHe7F9DjCdidHYi9K1Yn84kMBlJ5mAp
         wriQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFdhNLv8WUxT6M0yWZYQEZo9vcOssE46ZLVHPNCrjfAwq37gaD76bz1PdvZ/8R1WHD6WEsqqpfH6hPMRObrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYA1DrTQ6oQwB1CkZjDolcroIrNIXnjvuJrhF/h2eQ6CmZ4OJC
	O/FGE3Yk8UNZlr8Ji6p55LLmtP13Ob4NJWwJYMVK/V3MAswG5sSbqVM/hItoYSYabNpATUy1ARd
	bSoZbEnfX9DkVB84cRg==
X-Google-Smtp-Source: AGHT+IEtMPrBTDtt42DdHcV8/FsihzPxKe2LPSw5tuK9yCOfw0mIa+59YYpR7BHvm8ZaRw0lQbnZQ6EGDYgr+Nc=
X-Received: from wmf20.prod.google.com ([2002:a05:600c:2294:b0:475:d898:b23c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c1e:b0:477:6ae9:87d with SMTP id 5b1f17b1804b1-4776ae9091fmr2504845e9.4.1762430951751;
 Thu, 06 Nov 2025 04:09:11 -0800 (PST)
Date: Thu, 06 Nov 2025 12:08:58 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANqPDGkC/x3MQQqDMBBG4avIrDtgUqLoVaQLNX90Nhpm2lIR7
 97g8lu8d5JBBUZ9dZLiKyb7VuAeFc3ruC1gicXkax+cqxtW2P7RGZzXw/h9ZEQk4yZOz7bzbXS hoxJnRZLfPR5e1/UHM5X3umgAAAA=
X-Change-Id: 20251106-resource-phys-typedefs-6db37927d159
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1041; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=v8C8yVAE9Ny+v9yDr6VsXp9BWcYD+xa4DF1KLCBpzIs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpDI/m7X+heP/YqgbiZX1Gt1RjQZsNIEEXCXzkM
 sefQqICjj+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaQyP5gAKCRAEWL7uWMY5
 RuphD/9prTANQ5o2yI3jFwYwwCJaJP3ixK22fADia1t5O/qL9B+1d6yYpVdN2u/RfEwC/g1ABXs
 2BCEY7/CfrP9K8NsZyPxeLjnWa4ERBRy/CsJ0Pqu0Lo1mA+o55HqqRqYwzetZA494s/64C1F9DP
 ZIH/M2VBqEfpJ+C5b0y/0T6Y8dBnUS/Btxp0VY70v4pA6JZCTv4CZwAVeZFHZHDvJ9Gh/qNBMze
 gfw6YhiTljh6i2G5OtAv8AI5ZxBQ5Tp90apmU7cuTD3plpBq9h1wlv6O6TqVTyJlGPpsdpLitoC
 NNT1qxk7DHxRoTm4rZY1SnU4MXQ9ndU6kiFY8C4UA2Qry3XZviHifd2vnTr3j9dCAkxm5iMWETu
 FPYaY3BKs4+SWb3BgmYAM56VUz5GfAQsNaY3s+nE1g8s+4s2FNBAUw8BgtCM+XKtb/JFslitoGQ
 +/OgREqCgLwnkkZmN1hqVG7CvOtYMlKqCFMYR+rpcUwKUzjjVmt49e1Dpby25Ca7XrPzBy60VQh
 A8f2v99WTaKkjIQghayogekwcgtrNrD43G5OWWnKjtRJCM5kLMamzybTILXaT1Jif4TPFh8IGND
 rjufLi8PUdTpvDFq7DWEnL3y3LJL64HxiOKvJOoeOVckP+HG5eYkgacNxZeMH33hGZoU2WWPZYr tzeN1RyJ9+cYBoA==
X-Mailer: b4 0.14.2
Message-ID: <20251106-resource-phys-typedefs-v1-0-0c0edc7301ce@google.com>
Subject: [PATCH 0/4] Rust: Fix typedefs for resource_size_t and phys_addr_t
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This changes ResourceSize to use the resource_size_t typedef (currently
ResourceSize is defined as phys_addr_t), and moves ResourceSize to
kernel::io and defines PhysAddr next to it. Any usage of ResourceSize or
bindings::phys_addr_t that references a physical address is updated to
use the new PhysAddr typedef.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (4):
      rust: io: define ResourceSize as resource_size_t
      rust: io: move ResourceSize to top-level io module
      rust: scatterlist: import ResourceSize from kernel::io
      rust: io: add typedef for phys_addr_t

 rust/kernel/devres.rs      | 18 +++++++++++++++---
 rust/kernel/io.rs          | 26 +++++++++++++++++++++++---
 rust/kernel/io/resource.rs | 13 ++++++-------
 rust/kernel/scatterlist.rs |  2 +-
 4 files changed, 45 insertions(+), 14 deletions(-)
---
base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
change-id: 20251106-resource-phys-typedefs-6db37927d159

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

