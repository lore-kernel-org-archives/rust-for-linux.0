Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A86348463
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Oct 2026 11:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792235632; cv=none; b=AVhtFJcGjsBqdO2AdodhiN7GEEHkydPv4GZ+1B1nKKdVoRgBZn0jRs5pnxaqTZH1C1s+u5/huPfN5NRGBrml6ihxdm3PT81bf63khCrwU7bAHTbkhnZ4Pvy8RGH8whCjw4309j3+zDe0EJclSbrr5GcaRlvS3Ha3B6SPG2WYu1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792235632; c=relaxed/simple;
	bh=FBysbXBjMV0NHOVriinKcz93IS/EWybMwQ61PqXIavE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r4avLgqXWUIFUyUn9opMul+MIiIWLdvssdmKT1/VH8fwzElrxBl6u5r40+OQrOShCSSaSHjaSa6euruEd+UqpHPcam2eTzaVqPg7e2LTK/e4bIEbPZpfz1SAyWJFS0u/NDw5jOJn6gz2ZUEh+sDGDuLgpwzICS1A+2nCVnqNwO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uwi35L8a; arc=none smtp.client-ip=74.125.229.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uwi35L8a"
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-3599f43e0aeso394493eec.0
        for <rust-for-linux@vger.kernel.org>; Sat, 17 Oct 2026 04:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792235630; x=1792840430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FBysbXBjMV0NHOVriinKcz93IS/EWybMwQ61PqXIavE=;
        b=Uwi35L8aAkR02KrwA10v0NyOe++J0iNw6MTDkMCEN8v4ho51Z1xG1m0By+XW3gyFBq
         +nAcMQUx3yucOvWIfim3OpYwWBIJp4eZ6R2PxfLtTBR+J3Rog+ydnOUNRNhLHcY2iEQk
         8bBlfFQM+40dF/bJPPIDGIce0m64GoTulj2U2xy9LjUnB9sc8THS22R0a8SHTNdU2BOF
         H0C0KTqQ4zBLAA1gvd8/XqwR95JNoYmRjjKOxz0KzGYHgmYFdXpvNrJYPoO2S5Z+IeZ0
         +FEczMutxRbNAaOU0fkMN6CvUmpr6u4f6enh60GoRl+TkOLDtAuNTfnxFHLAm0YyExyw
         ELhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792235630; x=1792840430;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FBysbXBjMV0NHOVriinKcz93IS/EWybMwQ61PqXIavE=;
        b=m1di6ALah4OAS0MJztbotiYvOZo+QzQPW4EyArqycIPVbhY/tqOG5J1OBCpwMblrfZ
         eeOSiMfTg2Z4OQSqJEIUq2bFJoQ4NjRTAe9E/8yFtZJXocVkVV9bskGiZL5Mk7J9CB3/
         oyEmQ8FT+972b9If2N1LL9AGFWWARs7MM+2863xZVG403104N9jjFqagKT3Kay93lFgD
         YpTqWYmT2/eC+okVnKcmPIAI1rR+xgnsYx1UJVxSDuFTswTxKoAc8uw+Pt66GTr+vFRR
         dehED1um+72wfhqEv3R641tPPP1Wvymp5GxF6llZLkfqHIfa3/msZjwBtIcblKtoylZm
         1JJw==
X-Gm-Message-State: AFq9FYI1+mnaKgtrEh4UXJm5nra+7pEUYJ6jttsT5lHCixyJkgqLSwn7
	CAKngKy0ZrIEilKzQop5lIftEuMQ9OtbQy+b46AtrAb1LIC8OXWDbuWpHLTnlzvGU598pyMcgtq
	J
X-Gm-Gg: AYBFou2T9kX4ZGoVTX/EufmXVJNNHhl7MuxI+HsZAEEYi7ulFOc1es2n1/ory4F7PEI
	kt6B1/cASOCd11ecYyCTDm2w3sS6XfFUc+EtdjSpR8KjY+VlVxp5HhEhNNmjnW/sRDhwvybw+Lt
	Ek3sfrdQQ1wS+wBsru4yqqhX9hBtXAbFCq06jJMI40BXj49X6L6LiuNBdGvoyAxtBkKIQ/3V3Jq
	PygGNhUbWaIbjvqJYzxmITYclvPPIJJQKRnNlFa+oGItbPqMHQmB4ysnPalZKdrB7E98CnMbgul
	S018JW4xAnXy/nUNkMK+TU7i7/0HDHTONIqtrn2OWlRCPdRZa1IKRGerNwxbnMlJvugaGhA4MIu
	KCEgG1Bd9Z/7fN9BMaJxPt88vzqoWVpICrDo1oiu3FpivbeY7epC8W3bJ8gvCqLNPpJTt9SOfsV
	MQsx7x54hvtcA9fBU8rCzM/4lpKdVVckvB9I0xqiuKYvssN9ekgFWUxlWu9s2X7RiLLJhijtaBO
	BmoAiSPGUYGp8+q0dneI9LMGl//
X-Received: by 2002:a05:693c:66db:20b0:35e:2c6:d46c with SMTP id 5a478bee46e88-361a146d31dmr3320700eec.10.1792235629896;
        Sat, 17 Oct 2026 04:13:49 -0700 (PDT)
Received: from WIN-2DEDQG69EF6.localdomain ([2a0c:9a40:9205:1:be24:11ff:fe93:ff0e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608297f4f7sm14954458eec.23.2026.10.17.04.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:13:49 -0700 (PDT)
From: chenhan <chenhan0017.work@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: a.hindborg@kernel.org,
	boqun@kernel.org,
	fujita.tomonori@gmail.com,
	frederic@kernel.org,
	lyude@redhat.com,
	tglx@kernel.org,
	anna-maria@linutronix.de,
	jstultz@google.com,
	sboyd@kernel.org,
	ojeda@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	miguel.ojeda.sandonis@gmail.com,
	tomo@flapping.org,
	georgeandrout13@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: time: make Delta division and remainder fail consistently
Date: Sat, 17 Oct 2026 19:13:37 +0800
Message-Id: <20261017111337.22819-1-chenhan0017.work@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261001042942.109012-1-chenhan0017.work@gmail.com>
References: <20261001042942.109012-1-chenhan0017.work@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andreas, Miguel and Tomonori,

Thanks for the follow-up reviews. I have split v3 into three patches:

1. Rename the rem_nanos() argument to divisor and correct its documentation.
2. Add the panic checks and documentation in the existing Delta methods.
3. Move the arithmetic into the new math module and use it from Delta.

V3:
https://lore.kernel.org/rust-for-linux/20261017111134.22546-1-chenhan0017.work@gmail.com/

Andreas wrote:
> Then we can pick patch 1 for fixes and have plenty time to discuss patch
> 2?

The first two patches now form the fix, including the preliminary rename
Miguel requested. Both carry stable Cc, with patch 1 marked as a
prerequisite for patch 2. Patch 2 depends on that rename. The math change
is patch 3, without a stable Cc, so it can be discussed separately.

Tomonori wrote:
> Uwe asked for div helpers in pwm_th1520 [1], and I plan to add the math
> module for them.

Your PWM discussion [1] identifies unsigned helpers such as
mul_u64_u64_div_u64(). I also checked the current pwm_th1520 conversions:
they use unsigned arithmetic, including rounding up. They are not users
of the two signed helpers extracted here. Each helper still has one
production call site in Delta; patch 3 follows Andreas' request to
establish the module.
It makes the helpers public so driver crates can use them. I have not
added unsigned helpers or changed PWM. If your math module lands first,
I can rebase patch 3 onto it without changing the first two patches.

Miguel wrote:
> In any case, safety comment need to explain *why* those conditions are
> true, not just re-state them

The SAFETY comments now point to the checks above that exclude zero and
i64::MIN / -1. The remainder call also explains why &mut rem supplies a
valid, aligned, writable pointer for the duration of the call.

I also removed the two redundant issue-comment Link trailers, the
unrelated "a number of" wording, the C implementation details from the
public documentation, and the "even though ..." explanation. Each API's
Panics section now just states its invalid inputs. The issue Closes and
Georgios' Reported-by are retained.

The cover letter describes the runtime reproducer and validation, with
the API calls and expected results, rather than referring to an
unprovided local Kconfig option.

[1] https://lore.kernel.org/all/20261001.070215.521963012921142699.tomo@flapping.org/

Best regards,
chenhan
