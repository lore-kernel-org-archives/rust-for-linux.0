Received: from mail-lf1-f73.google.com (mail-lf1-f73.google.com [209.85.167.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66463C097
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jan 2024 14:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gGDg4Mls"
Received: by mail-lf1-f73.google.com with SMTP id 2adb3069b0e04-50e75f8d722so3129445e87.0
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jan 2024 06:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704982483; x=1705587283; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Io3d4sKqwm1HcGAZjKedXSlqmaItmxp3mcY9fxAdx0=;
        b=gGDg4MlsGuIuyzHzhc5hIqkaoUtCsjfkg7+vBSGeOYfTaGsQ/XoV90DIbL9hYH4XEt
         mPO7zEhGIM+QPj3pC4sUbfJkitAe/novGcNl0VNucWmPXATZck+7CJYEefUVKkyMfg1s
         PjPr9p3kXp2fZGv1By2LsEpaddewJKSETcZ5yXDAb6twtRza6XCVF/QwSRp/gtnwiP1u
         F/ZovC+QWHMS9nD+s6PFXsgC9Zz7RL8+rpoATYc+S34Ozg2GmntATLm557+cFZ+0oqvb
         ynHHcFvzRx8RXtyXfeOr4v1hsjgnFsx88H7RlvgX0jj5vagbx0O59QvzsLk6Mup+OHdS
         atwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704982483; x=1705587283;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Io3d4sKqwm1HcGAZjKedXSlqmaItmxp3mcY9fxAdx0=;
        b=Ba5d3J0UEP+OGraeGVjknebuBcMhehKhvSsVILZcOmImE5hgCTMuOJ44B6jyVyNpgD
         PoDJIqaDzJI5FgcdL0HxDF9qY0EBlCP5LXFDPs/y68IUh71pvX3aUYR3oKXdWMSR/5S/
         BFlhT8NAIDOcUAAhOgM3+E4gbiv2MN4YvsZ353Gl9ebzFuMhJ6HX1Ra39tbyeWmM5rSJ
         vPcpt8+wFn+sW9xcvjBsJQ8Niv8K6CClbitA/ws9IFZotPj4LKKcw3/cd31NXutgquWT
         sIgKS4isQeZJhoBUfQ4dXyjdSagAMD/dLhynZSp0TScf5avXIGNQwjVt1oIElbAq+CHH
         bzUQ==
X-Gm-Message-State: AOJu0YzbLFXWW0qh/s9f3mnc+vLMnT1qCaP8upH9otxdVhoSjC/sKZta
	bD+sCPFyaHPZWsXFB3QaYTOerK5/xoqzewEsvNnUvA==
X-Google-Smtp-Source: AGHT+IHs4cH1cEZSk6wjbyzNAIGiIJTfB0wYpOq0pVvFFplU/T0u+QfgC7QAzmIW2hHxWS9GrGBKiAUkLxeJdas=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:6512:2806:b0:50e:67e2:ad21 with SMTP
 id cf6-20020a056512280600b0050e67e2ad21mr1809lfb.5.1704982482740; Thu, 11 Jan
 2024 06:14:42 -0800 (PST)
Date: Thu, 11 Jan 2024 14:14:39 +0000
In-Reply-To: <20240111064415.908487-1-dirk.behme@de.bosch.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240111064415.908487-1-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.43.0.275.g3460e3d667-goog
Message-ID: <20240111141439.637461-1-aliceryhl@google.com>
Subject: Re: [PATCH] [RFC] rust: error: Convert 0 being an error to Result
From: Alice Ryhl <aliceryhl@google.com>
To: dirk.behme@de.bosch.com
Cc: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

Dirk Behme <dirk.behme@de.bosch.com> writes:
> The existing to_result() takes a (signed) integer from a kernel C function
> and converts it to an error if it's negative. Additionally, there are
> kernel C functions returning an unsigned integer where 0 is the error case.
> For example gen_pool_alloc() and friends. Provide a mechanism to convert
> this to Result too.

Hmm. One difference between `to_result` and the proposed
`to_result_zero` is that `to_result` has logic to determine what kind of
error to return based on the value of the integer, whereas
`to_result_zero` is just hard-coded to always return a specific error
code. Furthermore, I find that usually for these functions, the error
code you want is not necessarily EINVAL. For example, when `kmalloc`
returns a null pointer, the error is ENOMEM, or when `fget` returns a
null pointer, the error is EBADF.

I think for this kind of use-case, we don't need a new function and can
`NonNull::new(ptr).ok_or(ENOMEM)?` to return an ENOMEM if the pointer is
null. Similarly, if it's an integer, we can use e.g. `NonZeroU32` in the
same way.

For an example of this pattern, see `File::fget` in [1].

Alice

[1]: https://lore.kernel.org/all/20231206-alice-file-v2-1-af617c0d9d94@google.com/
