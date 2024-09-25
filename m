Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C48019049D
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Sep 2024 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727276552; cv=none; b=ruDmiKxtXRlvid/K23wMfQywCe4Ds4zCLcM096vZqkLmwmrikA3OO+VvmixEDdwt/c5RuYaZqvXlm5eHpKa/cHvfWuqcvL0QIgQTbzew5onMUXQpcggJlZA+XVIeoJR6GT0NJ5JNkbyESiOzOO0LGucDgHdwcyzDXam+YdDMAqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727276552; c=relaxed/simple;
	bh=tOVKR1lo4TSaVSSD57+XbfuDxZ/gh43zpiGViV/8Jbk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WABflt4cN9Cl3Y/dKnvDvajOiQZRYtqCRdKadOd+onNTZl0PCubmt8IGsaCs0/HwdSkCaq86DgrbIliWpG+k+w1KUUspTXOkdn4OLdvqz+fD57tiB69whJ4R0BUvKVT71yCqtNTv5+W5ULHPBw5IzGEmWgPpGBs1pVSZo+n9L2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GnkKjhtp; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GnkKjhtp"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6dbffbae597so115557977b3.2
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Sep 2024 08:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276548; x=1727881348; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ApY23d/9zEIgxeEREKcGvRSADQZAXD1f0/BrlQ4mdDw=;
        b=GnkKjhtp9zSMZYTexidLqwKc++D8bRxlmP6vfNPPiswSuKsY7b5gjmgIVcyTHNJmXV
         R7cILxiDBk7XWsrqChfpEINGugxqUdT9I5FgI4htYuOm1ROc5WGR59a0jlhTFRO/tjum
         CWVybAqQtX2snhNPb+A1mhvliI+J7VlZ0xZ3USnRGgmL1vakWwE8brOdDD8vlqavUm12
         lanq2ZcCA7IIW/USsG0YE1Oa6h++SWt4alvAWiXjABfnGQRDtvpHHc+Nrb+8CBRvciCq
         nkpjydToaKAfAY4HeApliRfcLdyZvFqwlsJLIYZPyN43lymbKggonsBTZKs6FZRRm5WP
         HXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276548; x=1727881348;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ApY23d/9zEIgxeEREKcGvRSADQZAXD1f0/BrlQ4mdDw=;
        b=gTyf3TDkyNbA0U/AI1XFOnog81ysru0Ncylpjdgb8PA0nFa+faMZQTIdH2aLiyKW25
         fFYJZfXL5xPqjp/4NyayCjDf0JZYjq3acy5oF2WqHTgx90OawTqratNXe/kuWPZD6ZzW
         3uVw1La2YvtejqtP2QGWBYAc/LbeS8Ki8NhXY1j1WwOjiiDnDGYQsStszsqHxcgm8JTn
         9B0GV3/nNm+lj+bNyr/A1bX+7/jU3dmWkGEkdUeo8sJPCUI/WE2YT248YEIDBfI0X4IS
         5WD0NlfwqxpK+6FuSe9JWHBuDjJg/aWcyfR5DTP1el/2Kdv3axyDmE7nXVmBZ1imPIqn
         0PZg==
X-Forwarded-Encrypted: i=1; AJvYcCVjqWA//0emxxBFNWLt+qg+atpin8w2N5lkhOazld2xakAwOEqBLzxvEi7oj+tq1m+jSC8SuFsSZFLgMUf0yQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1TbaR8c3ZrhUeI3eyu1YyLjhBKp9hGKRxnF2sas1bnoQyFpw7
	whl4V6S0BLCVdCqroOIfs6fvAW6RnXYGlI7KCO7uxLdhL6QALvxbZXdYy699QmGgpHFNWg==
X-Google-Smtp-Source: AGHT+IG0+ryHhOjgZiIz9yF/upguc+H1WcXc9rbc3LtAhjefmA+cSn7SHizdSFamvUM2J9fCM9A9Vr3/
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:690c:d85:b0:6db:e107:75a2 with SMTP id
 00721157ae682-6e21da5c761mr429007b3.4.1727276548084; Wed, 25 Sep 2024
 08:02:28 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:15 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=715; i=ardb@kernel.org;
 h=from:subject; bh=MI3z3hAzDWNLGP+bB6WD9qNMTMv7yb8jTXTlUIfHWCE=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6sHwPz3fHPWC8oK2RzHe5nszs/XmM4NX7P1ae3YFv
 bWd+fJLRykLgxgHg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjI/9UMfwVfxZ9hrm+9xvze
 6zfvw/cKoUe5Kv5w1pmKsYfxH/f4do3hf+75iD2ndC64zYjxsFPZpbpKIrxBk/fzstDCxW8eO9h OYgAA
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-45-ardb+git@google.com>
Subject: [RFC PATCH 15/28] x86/sync_core: Use RIP-relative addressing
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Uros Bizjak <ubizjak@gmail.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Use RIP-relative accesses and avoid fixups at runtime.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/include/asm/sync_core.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/sync_core.h b/arch/x86/include/asm/sync_core.h
index ab7382f92aff..cfd2f3bca83b 100644
--- a/arch/x86/include/asm/sync_core.h
+++ b/arch/x86/include/asm/sync_core.h
@@ -31,7 +31,8 @@ static inline void iret_to_self(void)
 		"pushfq\n\t"
 		"mov %%cs, %0\n\t"
 		"pushq %q0\n\t"
-		"pushq $1f\n\t"
+		"leaq 1f(%%rip), %q0\n\t"
+		"pushq %q0\n\t"
 		"iretq\n\t"
 		"1:"
 		: "=&r" (tmp), ASM_CALL_CONSTRAINT : : "cc", "memory");
-- 
2.46.0.792.g87dc391469-goog

