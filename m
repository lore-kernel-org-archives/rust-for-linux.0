Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C976C3D3489
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Mar 2026 22:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773441572; cv=pass; b=kJPESdOqkKTeofwzNiT/XFfDK+gkdsr5yPw9TuElCo3f79QLcphHBPH4H74U/spm4KK1ErknXDRYT2Lvfb3KtznRvJ1iMmeQ841Lf60+Lh3vuxiJXqcG1gklJDL+BS/GfSkWGSnQXFE1oQtX1adVotOwO/vYBTSywOVH6I76QxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773441572; c=relaxed/simple;
	bh=1MXpnJgNd9wve0xok691+KsLsOIVO5aHkrdME7CbtZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hei+nX8brJ6KOHLrWBiEcsVOKI0/ysnVtBlidYc4YfKcjYQQu1tZE0Npx/0vbxU9Qb4RySanf++mwaiSFKMd+3SXistFVO4t5bsgWtTxqHfPnNZVf9Tl3Nu+pwBaRnbBHoCfT/bX3Fy4n1RDnF2sKwGtch6GzZhUtVFXx3meuf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQbT3hQD; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQbT3hQD"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-128edc72f3eso148693c88.3
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Mar 2026 15:39:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773441567; cv=none;
        d=google.com; s=arc-20240605;
        b=H34s92js0trRCGK+ovXOb45kk75b3CHAN7/r5XFk+TLRHrKRS2MXVZ2pA0/PYbe4uV
         cpZbhklJq6uaMse7i/WqI9vsScFAdYKy1hx4ar7r37AxKBNR71aL563o4jBkzr4+tMYY
         pZ/UQrZvrryjt7GIkp8+e5bi1Bsss4mP6De1ur366ySAF5+4yzseuZXXvzq+ffkWLDZU
         qAYNlwCGhYciz84RWxpwp3wI4Fr7nCRjmnKWfHEonnDa3O8LSlA4dJHYH7WtD0msCEnL
         qZIbng13GdzzSRZSYwn55tAaBj09rSTXbnzOepIeXKm2OyA01thg/878tvBOLjt4I8kI
         NxHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1MXpnJgNd9wve0xok691+KsLsOIVO5aHkrdME7CbtZs=;
        fh=Xfig/CkhhkaM2fjV/cTYymESI0rFGmKDB+4Ziu8VhVw=;
        b=lIVrNCBcsHqQpn8R7ihqwRT51jgRESHEkE7n04Grrl8pu0czi2EQy496DnnOamMqdW
         0WKNi6UGi920uiBqmW9aRpwoaNsqQls5QoTeQ1ev7t5X/r5JYmpiDdR6YsQwm/lARYS3
         370SgjU5P74xNxs/AY8tw2K6dc6uL9JJ6b5ZU4Ui2xJHmRxZhQgbWw44pde9AgHwztLV
         hSYCSl0KTV9zBsWPIIui9MahgCO3m+BbDTqvTm+hho6b/HFexsumVlFz96Mc2Z0eRAIT
         3IKyBdTF9LV4G35xSok+2AI/f5/y2ZGKlNinjazciCCl3uHXrL7XpIPjIuBWc5Nl3OKB
         nCLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773441567; x=1774046367; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1MXpnJgNd9wve0xok691+KsLsOIVO5aHkrdME7CbtZs=;
        b=RQbT3hQDtw2AE+LfgPkIDUJljtlrKDUdKtSoyEfOWud233VPAkPhHrlIdyqeT6HlLj
         lJ263t4vUtlonJ/L72NI7GR3vgKZTcRBuUJTUlc0eAIkhqtEesFYRM26ztsDc4gBpxrI
         PqWT5IYY1nWBmXmHDnnHJwV2c41JrTfVMs4pIOziPKKLRRoCKaU4BD8hdS9+O0NJ2VgS
         oN3XH5Fm9pabVP8dL567J7t27aua/vkm/UP2COwrlq1JgM6XniFhoTL4/KSuVrGDWDbs
         uNxkyd3u3P8h6yksZ8ZQRNptSokzBFd+IUksVbFT/hbe1pDfDV4+zbouqJqnB+DPJkVo
         S2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773441567; x=1774046367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1MXpnJgNd9wve0xok691+KsLsOIVO5aHkrdME7CbtZs=;
        b=tE2AMVsVxFKlWIv9F+SsTpvbM8baOUZMp0YRuBPW1GT4wz758sCcIO5U3ec/05Casm
         8SfcIV9tSQk/SmmDwT44dVFRcoAHrav2jqA/jmDPOOOavXQ0WfrLqvl3WUS+oq5HI8eM
         rd3szZ8jRhnk/3vqptvJPljmaoSWGylW8hMwDQlx4izPmlfasXP2CTN++LX5eOYexeJW
         F+Z2Yv7LFTjqu9Ifq5e/oojqSzS0DI2OCT8XKGYiouKYVhSGu6dMsG3wDc8uvON/9o7K
         1+8m9QtjXQgCYH/POSVg7K3PgMb/OlcDh1ZHgonv9dYcfL9MpnKoMUP/QHfTX5edBI9F
         Xlsw==
X-Forwarded-Encrypted: i=1; AJvYcCUboaES0/dchP4rVVRc7q+9FuEr/qRiyZVfe++9/41F9b0rj4xuZSX6mr8xgt4B59wtwH+zAeNX1KIGiPHS1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbHDlNSR4RHDWVsdOvIZtlvqeLRGVkZYAaDkgdO6mm2ASFEIbN
	xvZz0Q6UjuEEFDLQVakGdhdHFCzuaxRk0zW8SfqZ5xW2tDBPikzghq6+ysByt1FDOvEB6hlcaTL
	g25jcG9mcsLfS7U6fbDz8uH2KXXjLRkk=
X-Gm-Gg: ATEYQzzosMKJ3hDikRMvEiiKZrXfKxggvB/oCuRyalWx55RIUP+YwW32UmowX7RNLeX
	lF0ZNC2ZU3ThjZYtG2sgMx68Pon8lJyfezqL5QG5hGOvGIfSqSC7V+IJi+vzZDf4KaDDcHZnBw9
	cI+ec9c1rhYK0wZ3j4nqu82htdjAd7FcyjrVRkwpHR0XMSRhvJJJE7LzWRVwdHrCdGMtba1KNFr
	4ij9plhG/IJku7wG0tP0kRujs9IZyE/DHVmctFnT+M8iWxq24g4XtKD6V0+VoChyhzz5UN2exeJ
	QD7rOHDJUv1PXRa1evnjrgs/+FvZQkrBkm7iBdQpu/tXGt5IYMHmM2dMtx3QCatbayL5Wkr7973
	a5o9532ZbUCOIrSlOkY3kzi8=
X-Received: by 2002:a05:7300:fb86:b0:2be:e92:7f44 with SMTP id
 5a478bee46e88-2bea572033amr1222141eec.8.1773441567469; Fri, 13 Mar 2026
 15:39:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202603121235.tpnRxFKO-lkp@intel.com> <20260313213638.GA147391@ax162>
In-Reply-To: <20260313213638.GA147391@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 13 Mar 2026 23:39:14 +0100
X-Gm-Features: AaiRm52mq6KFRynN2HWB61zFcs2DGJMHqt1i6x4Cnd5DvVDH6nH69snDO17l0xg
Message-ID: <CANiq72mzEzjNg7O_2dWT_6QOJvJ3TwV+HyxNd_F4j6v9C+pc7A@mail.gmail.com>
Subject: Re: [linux-next:master 5585/5731] error[E0277]: `*const
 kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Mike Rapoport <rppt@kernel.org>, 
	kernel test robot <lkp@intel.com>, Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Mark Brown <broonie@kernel.org>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jann Horn <jannh@google.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 10:36=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> It looks like this is a conflict between Alice's "rust_binder: check owne=
rship
> before using vma" [1] (currently in char-misc-linus [2]) and Mike's
> "userfaultfd: introduce vm_uffd_ops" [3] (currently in mm-unstable [4]),
> hence why it was bisected to the -next merge commit.

Thanks Nathan, yeah, adding a raw pointer (not function pointer) to
the struct makes the type `!Sync` in Rust.

I assume this is best handled with a patch on top of char-misc-linus.
Perhaps creating a wrapper to assert it is `Sync`, since the
`BINDER_VM_OPS` contents are unused (so far).

Cc'ing more folks related to the commit.

Cheers,
Miguel
