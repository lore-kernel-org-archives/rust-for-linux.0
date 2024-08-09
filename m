Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2FB18C906
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Aug 2024 13:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723209389; cv=none; b=fvcevtGqCNvku70bAGRF7tFbEZRav1YT/Gwf7ihmNxx9AR4C+ZQhHrQmZlliVYjgoK8efrfeWaXY/XXw7KdWEdoAgy0pytjnvX3+GRepyt6KdkXofMuvjzqwNJSjo70sVKzLRCzv2/Tj7WHIrJpAjE5BJ/BDqnERnZj3WKLnNzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723209389; c=relaxed/simple;
	bh=92qOkLCSYu9nmceUlAEJm9hX6RmjzSfHnPjdMwunYvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Knzw3isNKkdeYSzCsWVkRCVglMvYIZqQQPtsp0XND/dYV8yQkGFfASTwdn+FHq9PRCrhY4Fm0/AOsfSxdD7W8Ac/m2OSodIlRwfqtG9pt5JoIm/uvABG3aJuro++sOUHEabBhQnsihwbNikoZxeFgooBUtMzcce6jWkR2xvKrR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ij8QSxps; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ij8QSxps"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3684bea9728so1234500f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Aug 2024 06:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723209386; x=1723814186; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92qOkLCSYu9nmceUlAEJm9hX6RmjzSfHnPjdMwunYvU=;
        b=ij8QSxpsg2UMcdzOEQX4CYZL1OeZI4vWBGBX5QHtR3glQk7bQDkbcfZhjuXimJCudH
         HS5Qro1ADMVr/yIVw9KUDRSoYTGNYoBN/PN8EGYzuOGYGcBWeAJxMKCrbw2g7Ol6YTXy
         ZrckBN1y/ao7E8gjfUxDlFipKqZBIM1IEoxzy/a2Zrp/wgmYa8fjd0Y1oMml3OXg77OM
         5GlzIJ/Gh4dAwfe5hrPUNoMgeCzDM63gLQ5D+qwvtPS3WksSw643bob6/XSPO7QC07GH
         J2CgivjRtgZslYmjhwokSkBfNPFGpotCtDXHVk2g7PVASHrSVPCFVjuyuL9eREjEPrQO
         5Kww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723209386; x=1723814186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=92qOkLCSYu9nmceUlAEJm9hX6RmjzSfHnPjdMwunYvU=;
        b=uhZNGfBanficUbb/sbh2yBJU1FKwCSl7vra160EksXzYNftOvx+QJnV2E8b9vf7iuW
         mzjZtH6iHjcFdij5sEiYFOdGtKqEwjzT4u3OvwOiGXQo7Cjvh0GKChdgWf65LZlfbOP0
         CvDzUZTLiCqH2BoyXPNPWbT9Q2PuknWsucQ11uwwQ5bcAb7KHxMqIRTZtOj3lRviFjyz
         78ms56grWYSGvkcuX0iN9+ND5kbd0MRp8JB/6+UeUKrqC+JwpEmn766oNk53azrj5FsW
         qhqcXvOw2z85cffBm5e3HxDimJ06s1mgjHONMtmAUUBnLfCFosmrgjl4mztM72nutCIV
         bbSw==
X-Forwarded-Encrypted: i=1; AJvYcCX6ZLfZ97BH8vicaR2/uXgvQ6eY3lsROwm0q/DZpuBMs3S66gkE8sfMuG5i6pRg1ZIFXAgKSeZNVWjiI1on3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXhjj75Xv6unGHkFQwk5Ncxf2BnrhTJGJuwoenREITnrIMZ0I+
	2Xs9lLTkMSkKOWWG/qU4SWIIyq8otuI4GstaDk6d8/D5XZDgp6wDq72S1RTDUMf3fH8GI62xXkJ
	MXjipFdiTc/JnvmMMvpXAr1IUZSYaJQyKJKowNqOGTisvRieI3kLm
X-Google-Smtp-Source: AGHT+IEencuwb5ZiZqBxrl2yiXarWFIGCnvBaoEIUj3k90VcnrheSq2WUA4koqg2hebfaLRX95IYrP+jEef8wEWRJhg=
X-Received: by 2002:adf:f545:0:b0:369:c6d7:7b93 with SMTP id
 ffacd0b85a97d-36d5ea00d30mr1177252f8f.28.1723209386152; Fri, 09 Aug 2024
 06:16:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240809064222.3527881-1-aliceryhl@google.com> <975158d8-4f26-4b5c-9cc7-eec15d901eb6@kernel.dk>
In-Reply-To: <975158d8-4f26-4b5c-9cc7-eec15d901eb6@kernel.dk>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 9 Aug 2024 15:16:13 +0200
Message-ID: <CAH5fLgiqQ6GxPk4-JCdRnKmi9ECgzVj+MkoUnZLYtUp8-yCebQ@mail.gmail.com>
Subject: Re: [PATCH] rust: sort includes in bindings_helper.h
To: Jens Axboe <axboe@kernel.dk>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 9, 2024 at 3:07=E2=80=AFPM Jens Axboe <axboe@kernel.dk> wrote:
>
> On 8/9/24 12:42 AM, Alice Ryhl wrote:
> > Dash has ascii value 45 and underscore has ascii value 95, so to
> > correctly sort the includes, the underscore should be last.
>
> This commit message lacks an explanation for why the change is
> being done. Yes it states that it brings the headers in ascii
> sort order, but WHY?

I can add the following to the commit message:

The headers in this file are sorted alphabetically, which makes it
easy to quickly resolve conflicts by selecting all of the headers and
invoking :'<,'>sort to sort them. To keep this technique to resolve
conflicts working, also apply sorting to symbols that are not letters.

Alice
