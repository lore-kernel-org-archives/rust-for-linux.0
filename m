Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D105A4D5
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Dec 2024 13:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733663760; cv=none; b=E7iKbpd8lfd0qdbv2Is89oHvUUoVrBsirSQPFwhJFjo/xCOdkhG65n8n0HBUtW9W2g00e7G/OjLhPgKNv4YVIwBCkXoZMaMlnu8Cli39wIHhS41xQxYenGEcZZRc6uKMi9DxSrivbg7+LtpRsbBE4FDTfhvAZZXOmZjR+YvTulA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733663760; c=relaxed/simple;
	bh=OK+t3GChPUsuapCE5XzaNht0SWq3dZ0OAxE+5xsKkd4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UZPTNZLMSFMCLLmFhHAtKEnECvgH4GqxJLpnDg+dbKesmzsSL82OTo7+w0gqHj0WaJAyuMiBslslmmpDyKMoSzq1eP1KR7wtUnIP70/2t3roOEGPgGh8DuVmkIxjcCxlwdSFflM0IFUh6BBeFXCauS5xt9PurYVfuepP7hGcJEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=JO+L8Dyk; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="JO+L8Dyk"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa5ec8d6f64so393991366b.2
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Dec 2024 05:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1733663756; x=1734268556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y8VwGD/eWi1bPEhBByF6NXOsDE0WmfR95GgjInLF4gw=;
        b=JO+L8DykddWbHam9L+3DwvvytGovbADNN7DM2Dl0oBow5bct7XQaLHFjMtW2TicT/X
         wJ7AGN8IcM+vUxft3ruKqd1PQGryNhtzpY5rr2OFdsVc6uDqeg1YXF/EMbYZP5j22+Fu
         pV9gckF/T0cgQf+orCQyBmdzo3sAYfFIqb9pKACB+zfFmuF498jmMyTETUyLKT14ihLT
         jftjjI3k73pqihEub7kd1MGcscbEvP1euszjHbjTpwgtMZ+1PiTjviMJnSngW5i9k4LH
         KNyjUVaR6sgUVIQcvedQx5xGYuAYZlNSnvJNQq44dkfNVQZkcyYp7WxDobJtO9G0vglV
         q5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733663756; x=1734268556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y8VwGD/eWi1bPEhBByF6NXOsDE0WmfR95GgjInLF4gw=;
        b=gnaULqAPTJGBU6nWGtjUE+ROagi4dN2drjHkuye/lg1ovP7K22j93rMOeYcC0vK45Q
         tk+q1poKmvKAO1CsVb9oGSzcPZckjai5q4gHxFgcYhM15jJ7B27qQUvcUkokXmIuzJUg
         6NAZ5mEhS9H62trX23uvycOApg7D5+VF876h7KBTh0TrXvKQygdzMSxFEkQLW49Upg7/
         OYCkVh/W5z0aNzVY1RGdGsDx5tm2X777T95i3aVWsgkVpBtOFAfz+iYoeH020h4wz+ri
         sj7eK1dkb//kUK/DcVEWVZIDjxfkVX5c760Nur3YBLgM0b2FlxTxgTtRhR/SOmwIf4qn
         qC1g==
X-Forwarded-Encrypted: i=1; AJvYcCVA5kC4nS07rsFHICpVKqxj5brwvb4r1b88mIUB+jqk7KMcyIqVurjQzk3FjqbShA945eeH7PjCGAqblL/yXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDjc64KLo/1m02z77i49b2VLNuTFgZAAzdzdtMJi5jfBsN9lkx
	2dj8a4v84gubsOdkbiCJrWrXu7FQSEPuNDe6cY1+Sx4DvvZTSHuYRyoRMlb5ExY=
X-Gm-Gg: ASbGncuDxVKgy6xY5/F/tczZ/I1sMRPPUGDwSy7qXO7U0VS0dYVkLUWuZNsS8wbtLiX
	ZJVEgCCuHrxKsKx+DYhajlY5Kw3rj4132Y99s6mCwGko6CcdScjGMLRj7oSpDZcfjxD7BxWgbp1
	ljUA8XPV6roPHJJgnfVWELL/BSTOuPzCuYMrctmfumcxk5OuVZOlyD8WE8Qycg8EBs5uEeGkKEV
	8SEzjrhUbHnKFHdvSXZG4m+j7qRUd7h+N/cT33hlTo=
X-Google-Smtp-Source: AGHT+IFhUqHMmdTFbhl4tAmm67CExcTpb828ejxQnZeZ3AZXuBa1rHTinUnDv2E7FFrkDaXy5arFZA==
X-Received: by 2002:a05:6402:458b:b0:5d2:7199:ac2 with SMTP id 4fb4d7f45d1cf-5d3be661af9mr22793704a12.2.1733663755742;
        Sun, 08 Dec 2024 05:15:55 -0800 (PST)
Received: from mordor.lan ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e96c19sm529078966b.42.2024.12.08.05.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 05:15:55 -0800 (PST)
From: Daniel Sedlak <daniel@sedlak.dev>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Daniel Sedlak <daniel@sedlak.dev>
Subject: [RFC PATCH 0/3] rust abstractions for interacting with sysfs
Date: Sun,  8 Dec 2024 14:15:42 +0100
Message-ID: <20241208131545.386897-1-daniel@sedlak.dev>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,
For now, there are no facilities for the Rust side to tune modules written
in Rust in runtime or for just simple debug output/statistics from
the module. For exactly this purpose, the C has the sysfs. In this
patch series, I implemented a minimal sysfs wrapper utilizing kobject API.

I would like to collect your thoughts on whether:
  - Do we want something like this in the rust part of the kernel?
  - Do we want to support all sysfs capabilities?

I implemented a sample to present the API I have chosen for the Rust part.
It is a straightforward example that does not represent all capabilities
of the sysfs. The documentation will be potentially improved, but I would
like to first settle the abstractions.

Thank you

Daniel

Daniel Sedlak (3):
  rust: kernel: types: add mode wrapper
  rust: kernel: kobject: basic sysfs implementation
  samples: rust: add kobject sample

 rust/kernel/kobject.rs          | 271 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 rust/kernel/types.rs            |  17 ++
 samples/rust/Kconfig            |   8 +
 samples/rust/Makefile           |   1 +
 samples/rust/kobject_example.rs |  66 ++++++++
 6 files changed, 365 insertions(+)
 create mode 100644 rust/kernel/kobject.rs
 create mode 100644 samples/rust/kobject_example.rs


base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
-- 
2.47.1

