Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E2050E58A
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Oct 2026 09:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057616; cv=pass; b=VVpdVtBAKd9kcuPjPUWDPXDy+vtT5DcDK3AmzvujEXgNipErTSJN54ldt7IaNUYqAxGLKKpyHhfrAFfcz1SGkY2RENUeT5HeVoL6hB6+vwl1i5qIuqYeqLRbGhnE1y2R6SzjQENRFMkQEGTlfHvsSvXX4NfW8s4czrzlW30Yo2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057616; c=relaxed/simple;
	bh=ICrTBQhAcFMBle4ZO3IusjWW50Bxu9MMe+LD1licGqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L7u/HJMDScX0Qr0Rj3hhe47+b73QxRyV/jKhoCyBCAZOQsVmY4jGnZPsekm6Ki0IJp2IBVZJMr47owBY7fAe8oDhYlzYjFeeoVrFj0q/FGG4rB2lxey+t88xnomVURtbwyQutrhWpcKukhtQN9zRHkwAdmX2Fk5tJdAXKe2S8EQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=P8s3zewn; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="P8s3zewn"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bcf21cfbdaso346440e87.0
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Oct 2026 02:46:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792057612; cv=none;
        d=google.com; s=arc-20260327;
        b=juHVmkuBFm68pgv/ZJ/7EUnh6xnyNA03hvvNJkCypv8s6lrNBVCR7orZAJOvOsGFB6
         ibYdZfXRQRVvdtMEIFduPkVOhVatEwa2JspOjEQDwZgDhp74N5CMiHRs/wqZ6h9opK00
         8Q54acoIZrNE2lskap2SEK5xB0u5f8FYbuPK+/BnPTNqpHNNSMpce/Z3SMFlzxPWgLXg
         5iBKvIg8C/QE5LLvtGvg5MYIryhyTnn8bOe21rhJslnKBHYQA9PRCBCGCjNcLZtyFrk1
         7lRdy22ImbNHwdStaS5I0fgMj2lZnVN+3ffakjH6ieoydUHURm9tctlocypy49hIpY8K
         kfxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KZ5hcI7sSvmMGW83CeAYEeOw/S5ozCHpu45O4BxP46g=;
        fh=bBusiG3VGRRyy12GrizfILg7U1SEkv9HjnUJrnL8AO0=;
        b=o/hYylzquY6yVyHTq6+bCDUEh8JJ17vI+dsWcLbRvfYJ9kxIH0Q13XxdzG7VayHu4Y
         9BKqeiBIlKrPar9hi9dXVd9Oulzp2+PmMKkWopX71TGbNppaH51Gut2n3iwKSa2VGcZZ
         72ZGAh7zhHDfqM1Ue5/c25KwreazJgoCG0nHgTp70TTEaaBqcloEt8ll+BY1IiYbVp0u
         1OfLsQ6meG9Uq0F/jA8ycY8TR8R6Ff41dXU1IA4hq1IrDm2bSInmEoZ80dmOZry+tbdj
         DhNwBBVFLBywJJmLnNw6GkcFnQMhReYYTRHeGQ/jkRWsYkLSov2ifA15z4DzViDeeP2E
         ceiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792057612; x=1792662412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KZ5hcI7sSvmMGW83CeAYEeOw/S5ozCHpu45O4BxP46g=;
        b=P8s3zewnfLUipatq+GqLCGSvx1i+EJ7DV6ToSXJXwViWZ5+6/8kf8sUXAmHYA0WqF5
         dOGILgLTSYULGBXFCZaNARNcqmTUgIZZkHroeS1typd4X1bbk13RmWviU1ePgAhFRBpg
         EdOqKN4VwLFl0wNQbBTtDQbOicOqSBAJ8TWFBAVl6EG5RhHG6RWYWGhEtir9/DYxKXP1
         MGKazALbGicfMHQyJGxpTs4luLDCo0j62vDl87NXtfOUhnO6JNVZZTX3AuEZpV+ejq18
         vcbh4Rm5+MZ/+513KO5SxXN0Su6jVTq8fJCvIckEb6F48Z2/HeS3ATacZI9Dse5YgjvH
         GCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057612; x=1792662412;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KZ5hcI7sSvmMGW83CeAYEeOw/S5ozCHpu45O4BxP46g=;
        b=x0R+FMtrwpHx/bb1aFLWmGJfkuVrakLcxAAYkgsmP25qmbr5a/HZZB24OdlYc53YmA
         XwqRrLinPTTkeYYsrlib3Bk3g37U+zVtNvO9M4tAEYmgwVCTAOla+0dlpMdsj22k6ltj
         XKjj2V4Ug9nliHhSiyyRMxgjg+dDY9/i/R7lEDvsamxa5TwoOpbRdRRqJgjdysbhwg6a
         AmfEdPGHH+PPzkEyHt7ECZXQdMpcPx0ED0yfuybtHCPcfzbUyCORnuT4mP/bqP3lP9Bi
         S07Gl6vYgQl0oPx0SILshOSgMpRZE1QXNiuiWiYTr5OT0zFwJm4bboHRuImxNidp8QMv
         izwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHtWbsiJYZwMezNdkBRMqa16rOcOzVYt1dfEJNkvBgnZS2J9Oce7B48g73cDe0wd4Ilp9Y4CEWdGraI+YFzg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKkPux0a11+HEVkaj6wnH5yBO956Jn4TFnDgU+uIJ/CI3dwxJy0
	HwvUPjYAep5g4I42V2a4wAfQ4dyZBeT6/+r8nxbxMHQSrIDVLQrtOK4yE25EgP0aT3ZOc5o4NXM
	ne89PzfxvyGhFdLseEOlJGqIr7LtMrgVsaJv7NVRjCQ==
X-Gm-Gg: AYBFou1el14nnGbNV0e8WgQYOjPYQflOEKZHxjLzpUMkvRWKSMnytAy1pyyUZkigxEI
	zhKNgE6wfP39jT1+fAJnEKeOQGFstUVm+W7MVTr53bmpAuBL45u919yx/UTVs8SSbmRQEmPdSkV
	bp2Gmuu+ToXxGoaO96uS928WtJdRfHQiKmeLWtSy4leULcyeb1uhku8bfCTRgD4EbIhSB65LsoJ
	F+SjVcvpvAiQPLysXaqLOEsHTvasN/73blDzdciFEP6MeScO2+aQ8E8DTy122MFoZLD9oLXus2/
	yLGiRRFOV5PwsNFmwSGrqaepD+KnXQLse9guc5KAbA8ZIDcbfZ922eRRLERa5yJOW2/PgGXXiYw
	gAnMDZJ6r7YIZa8/ntepl+59s
X-Received: by 2002:a05:6512:3b8a:b0:5bc:cbe1:8ac4 with SMTP id
 2adb3069b0e04-5bcde35d84cmr7124226e87.4.1792057611692; Thu, 15 Oct 2026
 02:46:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014-rust-workqueue-system-fix-v2-1-c018b8f870f9@google.com>
In-Reply-To: <20261014-rust-workqueue-system-fix-v2-1-c018b8f870f9@google.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 15 Oct 2026 11:46:40 +0200
X-Gm-Features: AclHuK-V4MMe-c4XgIPiZC8N9eZ4vEYkszRRk_SEIQzq_Xg0na_JHo_eBAyU_j8
Message-ID: <CAAofZF4m3Fus+SizDwAdDEMr9V8RSgybveMhNg=nbM3dZj=JNw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: workqueue: replace deprecated system_wq with system_{percpu,dfl}_wq
To: Alice Ryhl <aliceryhl@google.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 11:08=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> From: Danilo Krummrich <dakr@kernel.org>
>
> system_wq is deprecated and triggers a runtime warning:
>
>         [    0.857414] workqueue: work func ...WorkItemPointerKy0_E3runB7=
_ enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.
>
> Replace system() with system_percpu() and system_dfl(), to match the
> previous behavior of the deprecated system() and convert doc examples
> and tests to system_dfl().
>
> system_unbound_wq is deprecated in the same way, in favor of
> system_dfl_wq. Since system_unbound() has no users, just remove it as
> well.
>
> Fixes: 64d8eae3f895 ("workqueue: Add warnings and fallback if system_{unb=
ound}_wq is used")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Boqun Feng <boqun@kernel.org>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Acked-by: Marco Crivellari <marco.crivellari@suse.com>

Thanks!
--=20

Marco Crivellari

SUSE Labs
