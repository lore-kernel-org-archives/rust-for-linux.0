Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D983835DA51
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Mar 2026 14:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773843708; cv=pass; b=HFqi/yX7EHy6LHkWr5xEYfr2MdHW9hUteE0EiAmGMu68tWlTEgGyKn179ze+Hz24FB8q4zr0YdVkwkAwUuPSF7Uf1LzmZsKkLPjvHj6+DlOYswmGMyNN6+90l0uf6Q6NxCw1idd1UroMcWlnhM/7t8WrOmU1NEL7owv2zV6l+ZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773843708; c=relaxed/simple;
	bh=KTRA21nAfVjporOLqz1nEfqleKbtz+pYNCQThiLu4Dk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SxGw51IvzcnWLnLbzbQ+VkbyHA+tftOYQo9Wvw3XhPMGWBQOgsOvqMM08nf1WlBHPgSOAGiB2NqmwMo4+v46MIZYX1MKgnUZyla3LZ7CNM7M7398wKd5RobZcF0+j02OwOz1KQ6HCX44QWzu+ZSwq+ljMvkjAPHH17DeAnSi+kA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncXnZeZI; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncXnZeZI"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2c0bf0a0236so153577eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Mar 2026 07:21:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773843706; cv=none;
        d=google.com; s=arc-20240605;
        b=kWbeFADbqhGXZ7ALFdF15EzikC37fUmYQRhEvWFsrDKTbMOMgoVhbKu7NaQJdS8Kti
         QuGdNG+kPZCiz4ice95Dha4E0yAENKwGalvhvLxyoV2MLuJpvdMVvd6YFiNjPBq12YtW
         vEOv8mDBOmv8o2278emx7eufyQItQ9ZiqiDpkRLIvni2QImmESimTJ7AbFTnyztKNgCV
         uEWIoKmtaMcJJrmPGBOxVo14dPxoV5dc0ggOtqTJmoJxdGrYy4iV8SRcI7uv99W/0Gsf
         U0bHhH2GxGAuIHf4P99FPdNFj17gyeX03fvr5k50wA1BkH8rHPmSSQCP8wHNgCpGNAe5
         gzVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N50RuEjVo0iFefZqItqTOtUCCVZJT3+xKOol5E25ZQw=;
        fh=v3tdFfZuCMQBf8o1N4D+0jZhVJVo2H2znzUDTR2AXiI=;
        b=Y4w2MqRbp7UdhW4HhoQtb1Qp599rULQUSYCVSq2c35m4+bYDt663GjeoiH7lRzBngE
         8lhCPcfWWxGNrDPTCxPeBfSn6mygLDnjuvAY2nKI5F/68w14Rz9PE93yh6JIlS8kAZPh
         0q7Pgt4uMbV3udeCEU7DQiiUQzjiXOke4hHS8pS/NBaSmGVjU3IIII/IanFukGUpIN8S
         UHRSrSkye4HJtkBL4pc9D4bEkzXbF2EB3IGY+ZCoQEb5tTE6cR2pvDfv9SBsqS+kySzM
         arbdHU2edUB4RUEuentO2+R4l3CtGgIZjUI4+OAs7wJVraG/mPQyehynBlFPOH4y+BC7
         UO2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773843706; x=1774448506; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N50RuEjVo0iFefZqItqTOtUCCVZJT3+xKOol5E25ZQw=;
        b=ncXnZeZIuOjGeXZuihtqHQjQvOfKIZP6avWEj+G04ST+7/5OoAM+9W4HrAWp2tpeCg
         qV3oZ6vSIUONar/YjrHxliQhsxbKSf++6gTYV2KDYAwQZzOMCUGbOtGkQ/M6lnz8Si35
         8cajHQ6rXnuUoFE7lWJ8eh1IQ1/C/m/4KUEtvM30T6T49ccOSw3rhnYbt7WWtvJztqGg
         xn7Jr0z1OgIglV1lijREgwEUFbNUaZmqaxtkOe9YCHFQ/TStonivbob3Xi4EZ7I40dRu
         mVfTvnoUa3XQQ/Jr1rI6LfuZlzc4c2+s5rVU8DOEKSJk0D2JdP+oTLNkFO/SoM9RK0oz
         +L+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773843706; x=1774448506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N50RuEjVo0iFefZqItqTOtUCCVZJT3+xKOol5E25ZQw=;
        b=kEWd6cYWTvBsaKUlVsOXblIpyPk740mp5XWe744KkOVCed05VXYnRzghegeUJowskK
         D/SY5sLNByw/G8AJ/KJMEpFoAvYeLxJzmyFVhnOsYbSmJ8oMJedLtlStOF/4RGX3wrGF
         QA9j+n4KCGahmD07IHURUHTWhkjPgSVxsqVn4SedaSzZzpo9xy1SLNMwXV4I1LF+lR+4
         35lBPLAXCLOfpLcehwzfJ+/gzqy6uOopm5VlbSmgiFeZk1AG86hmLOvw3TLFYl1Dw69o
         nNqJlmxnjIjWSfLstQPMs6LyIPE8hOvnr3dj3eY8QTbaVbWUqVgCmdVf/aaGwQBv3Agf
         0ocw==
X-Forwarded-Encrypted: i=1; AJvYcCVeaHWkXni/J/Lvhpq5SIhnputdg6q4CH2RRTQBmMk0nhDQh3IA3Lf5NS5W8bfE/ramTQNPC5IWM3Mdpg+4XQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCOQ75g6IJNh6vakfCflCXhDaKfR8Rc1TwfZ2nY2Vc/GPGHIVX
	w8CepT3kM6TJTjTCAjaWZoAEkol1rvz6lT5ljtNVB0hnYhD4bjjxuWlcPopeLuBZi7e93iXd434
	XM7WxJ6iMi4hVLdQcmL3Fj0tEymJ7S3g=
X-Gm-Gg: ATEYQzz0H8W1/JQhQR/FHlriHPqJ6mJxQW5KJjApKF+MgDCUcIcc3lW5bO9z7Nse5Vw
	4SKmfCHnkRFx4/kqpuMduxTeAuAXwMvmSvNE6B8BtE4xcLTJnuNeORYwjb4bLR6YM2KEvL35JMI
	BarcNRgnQIqd3P9e+u+/O5v08EyzKTOCSmSF9ccD8CKLYnSJsiqbejSml6UsJTldbRhvkGLqObi
	Wp51a5lIcl5sm1NUeiVPT1gx4O7ZruuGrMqBIqjMDyQYD63dN1t7tNU06kEurvgeBEBMCFDe1xp
	pX0aLDdznljiVjJooEaqWInh1Zf23LlCa+iB+0tJRIKkmSDqn1VyGk+OKEM8plA28/Iv4lAoLgu
	Er0cICHllCPJAUW9nMskOksQ=
X-Received: by 2002:a05:7300:3724:b0:2be:1f56:ed32 with SMTP id
 5a478bee46e88-2c0e4f79e7amr862302eec.1.1773843705849; Wed, 18 Mar 2026
 07:21:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317201710.934932-1-joelagnelf@nvidia.com>
 <20260317201710.934932-2-joelagnelf@nvidia.com> <46986da6-8c89-475c-8561-964adaa7d034@nvidia.com>
 <abppV3e91iVzplcv@google.com> <DH5UOS96171T.Z8XSRX583Q60@nvidia.com>
In-Reply-To: <DH5UOS96171T.Z8XSRX583Q60@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Mar 2026 15:21:33 +0100
X-Gm-Features: AaiRm52hYvm4SlfuaD_e2Ur_BKHJMunoPzi20wYq7repEoz5nN2Go3Dpr2oWwgo
Message-ID: <CANiq72=bmJ_GWKowAgv+DWQ8FcWK_HePwjaVgeDmRH+gVD-z5g@mail.gmail.com>
Subject: Re: [PATCH v13 1/1] rust: interop: Add list module for C linked list interface
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Koen Koning <koen.koning@linux.intel.com>, 
	Nikola Djukic <ndjukic@nvidia.com>, Philipp Stanner <phasta@kernel.org>, 
	Elle Rhumsaa <elle@weathered-steel.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
	Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Helge Deller <deller@gmx.de>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	Balbir Singh <balbirs@nvidia.com>, alexeyi@nvidia.com, 
	Eliot Courtney <ecourtney@nvidia.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 11:54=E2=80=AFAM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>
> Ah, so there is a rationale for using a `mod.rs` file after all. What
> are the project-wide guidelines re: `foo.rs` vs `foo/mod.rs`?

Quoting myself from a few years ago:

  I don't have a strong opinion either way -- this was originally done
  to improve fuzzy searching, see commit 829c2df153d7 ("rust: move `net`
  and `sync` modules to uniquely-named files") upstream:

    This is so that each file in the module has a unique name instead of th=
e
    generic `mod.rs` name. It makes it easier to open files when using fuzz=
y
    finders like `fzf` once names are unique.

Another reason was that it is what upstream Rust recommends:

  "Prior to rustc 1.30, using `mod.rs` files was the way to load a
module with nested children. It is encouraged to use the new naming
convention as it is more consistent, and avoids having many files
named mod.rs within a project."

  https://doc.rust-lang.org/reference/items/modules.html#r-items.mod.outlin=
ed.search-mod
  https://doc.rust-lang.org/edition-guide/rust-2018/path-changes.html#no-mo=
re-modrs

Now, several other people have argued for the other way over the years.

For instance, one reason is that tab completion can be smoother with
`mod.rs`, e.g. every time you complete something like
`rust/kernel/sync`, you have to decide whether you want `sync.rs` or
`sync/`, and then if you wanted the folder, you have to tab-complete
again.

So I guess it depends if you use more the shell TAB (like Linus really
values on the C folders) or the fuzzy finder (like Wedson argued for
in the commit referenced above).

I personally don't want to bias it one way or the other [*], but
please let's avoid having both mixed if possible (unless there is a
reason not to). I can put the result in the new guidelines rules list
file.

I hope that gives some context!

[*] I would have preferred a middle ground like  modules being inside
but repeating the folder name, e.g. `.../pci/pci.rs`, but I doubt that
will ever be supported upstream since one probably wants to support
the other ways at the same time.

Cheers,
Miguel
