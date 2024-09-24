Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A775C139D
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Sep 2024 21:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727212833; cv=none; b=b3IvujeJ2hV29jsgwokhPG1sJyWByZGM22X0YOz0rKYpu+HWCKu0V9QybTRvavbSMVEJ3sH3pjmGiWcqTziXQPpCQ50S1LBTZofLKNaCANf38bBawmcx/OUgZPXAZ28ub0dOsZQV1Rwm8iafj9y+Cug3wfU++eUfL9Q/OEqrAuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727212833; c=relaxed/simple;
	bh=4uQgOfLzN2jNGnXuk9hDp+FwixHEiuo+5M6Q4moArc4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LE6tWmeuLqx/IWHFk3KzUa+vuLV09p37HCkJWKbJcUKgYodz/ifdNHwRetGNy85juh78ComSm0tjzVmV/3jkej1Uk3lAnvVX+jDS6Eoy5QDLhANKEA+7d/FhZ9x4duw+WxfYrIuMtNNk4ndQAuYL5vaAi04Ae/UhEFnwczYJSPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZLyZYUAU; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZLyZYUAU"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2070daaf8f1so62953875ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Sep 2024 14:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727212831; x=1727817631; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZnKvCeNjxr4gzUFp08IejyfyOz5oSgFPo6kCvPhCi68=;
        b=ZLyZYUAUMvypmJ/2RYGlkm5EOCPcqjw7tPnJ2GKD5qBvLTtIheNpx+CL+y+Q7BV3aX
         g4S4Le65abA8aQ9mMhOolRxUvoxoUA9HVN9avhVVPBo6wafyYIXx85/2oLczl/fzNOW6
         MozNstRktNjyEIe7gcItj9N0KcA1Vrj8cMLIpU0wpQfNohawCtR59cYK6C6WasGkqjyV
         cgZ385pkJedDBhENbUXUZ8CWDL2q+ipsIA9QSwCPjKOFjS5/F9hcBfu1clydjiWo0tfq
         PBWv871QlHimoBolIkJ2T7OB4RC+rzKSVk0+f1WNxGwER/fxwtJRtdrTP9vle6x5pE4o
         /ySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727212831; x=1727817631;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZnKvCeNjxr4gzUFp08IejyfyOz5oSgFPo6kCvPhCi68=;
        b=DDsJtaXi1oXBZ9npSQdqApMkOGICCe0KOxoJmW1+z5l7b/n7a6Yk5HwKdUQIMZKSEP
         cSZYOtxPIU4K5i3xZs5O1svnU+LJFhvjrkpKT2seEVPEMfbXRljjN61ezrdEwwgdSeQQ
         WC4rE3t1c74PWnOUroDb3nRgusS1RsltHC0ss7Y8l163qVqouKPM6KGBapMwFLElqMj3
         x/oqdZUy4RzXaAh5Cf07+iRvNdE66rvFQtEW0FMDrRPoxIPIjJsIL7j0ZVV5ySXMrGWw
         Zm7Bh0lYRWoNwdVFlXfZuVQ0LCpw0+WldtoktconeHfFUDIfI/duF73/6mlmitbo0umx
         7zYQ==
X-Gm-Message-State: AOJu0Yw9E5O1bkcxOJyVxHROvToccmIKMqJVeAMjjIfLjUWID6X90shb
	XencGdssw+uFYz7dF7RFlsEnfu4tRztFi9Yi5zTDmJZVf8nizWKh2nsbdrkJgv6wqdcBhEPzmz8
	eLXfPIg==
X-Google-Smtp-Source: AGHT+IFqiTC8lY9i1xRnPoEmd8mO12INhGtHjP2rC0iH9E4KVVjtkPWF91yq9fcmuG+4oMOnxK9RG2Im48n7
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a17:902:d4c1:b0:205:968b:31c1 with SMTP id
 d9443c01a7336-20afc431f71mr214585ad.3.1727212830815; Tue, 24 Sep 2024
 14:20:30 -0700 (PDT)
Date: Tue, 24 Sep 2024 21:19:42 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240924212024.540574-1-mmaurer@google.com>
Subject: [PATCH v4 00/16] Extended MODVERSIONS Support
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, Matthew Maurer <mmaurer@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"

The overall intent of this patchset is to support long symbol names in
MODVERSIONS, needed for Rust support and some LTO contexts.

Only update here is to fix the PPC dot munging code since I haven't
heard anything else back yet. My understanding is that I primarily need
feedback from Luis based on his response to the original series [1] and
response [2] to the hash approach.

Full context is available in the previous cover letter [3].

[1] https://lore.kernel.org/lkml/ZVZNh%2FPA5HiVRkeb@bombadil.infradead.org/
[2] https://lore.kernel.org/lkml/ZoxbEEsK40ASi1cY@bombadil.infradead.org/
[3] https://lore.kernel.org/lkml/87le0w2hop.fsf@mail.lhotse/T/

Matthew Maurer (16):
  module: Take const arg in validate_section_offset
  module: Factor out elf_validity_ehdr
  module: Factor out elf_validity_cache_sechdrs
  module: Factor out elf_validity_cache_secstrings
  module: Factor out elf_validity_cache_index_info
  module: Factor out elf_validity_cache_index_mod
  module: Factor out elf_validity_cache_index_sym
  module: Factor out elf_validity_cache_index_str
  module: Group section index calculations together
  module: Factor out elf_validity_cache_strtab
  module: Additional validation in elf_validity_cache_strtab
  module: Reformat struct for code style
  export_report: Rehabilitate script
  modules: Support extended MODVERSIONS info
  modpost: Produce extended modversion information
  export_report: Use new version info format

 arch/powerpc/kernel/module_64.c |  24 +-
 kernel/module/internal.h        |  18 +-
 kernel/module/main.c            | 647 ++++++++++++++++++++++++--------
 kernel/module/version.c         |  43 +++
 scripts/export_report.pl        |  17 +-
 scripts/mod/modpost.c           |  39 +-
 6 files changed, 627 insertions(+), 161 deletions(-)

-- 
2.46.1.824.gd892dcdcdd-goog

