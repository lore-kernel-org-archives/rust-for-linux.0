Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9324C371053
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Apr 2026 21:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775251451; cv=pass; b=X5+ARKCFGpyqG4MUgPfn5iDn51Cgyh/G0O4jkx8cQJIybd8MyEy5dyDpWt0W/Bgv8FhW7e2zdkRFXNghQNeADZwsurqTx3bp/SASf414XBDfSRsutHv8axKKl+S8Nal29ETi7I12jIl93oBxMwclrSKsspT7g+Ivrh8TC7qM10E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775251451; c=relaxed/simple;
	bh=Cs3nAqRjHjioxjYHhaJzVFtzKHaPCe2OYhO+RwJxfGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZveSPy1O1vXYistUjY8wkIkgwqdh8jufYBOduJw/FuIQ1Git5KCzpgDFnLx+6DTJ6EroMunDTxQdFLC+n4iNY2jsWZA8ZcdcE41sCBZByn9LTe1gDpTt/85TtDsTm7tJKX/m/JHGVf5NVmFmLvj8zHu+MjxvZG7r5gQ3VDe4brU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MRoXO55O; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MRoXO55O"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c16286c496so86836eec.0
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Apr 2026 14:24:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775251449; cv=none;
        d=google.com; s=arc-20240605;
        b=VU2W0bOmM15fwTgQLw515i7e3D8Vg0ysQhG2oJLaMgdFTe4GesGY4/k8Td1rbzCkw1
         oHdoLXA7jmXu2dNCbhaWPmgRSTQ0ZmTJgBA/OLnxiO9Pg6k7ru61e4rrQ9Rh7SkIS2vy
         783j+R/WEdDfW0yCSiac4pz81BtXr75WLxCz1aNJa3ik1lv4ffJF0weID802tXBvQXAc
         ElX7FYCTNdAvMjbOUyJUyAY7qDt7ZP3M6XVhgXrucSTUqJ2X2T5B/dFRs2jfVFx0vXax
         josqEL1jFLcyJCrlCmfOhA23fDo1wG+iq2rRjIM/6MbnvFg/F0lYgElWWGsc+gOVZ7Hm
         uoGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cs3nAqRjHjioxjYHhaJzVFtzKHaPCe2OYhO+RwJxfGQ=;
        fh=70lJCRzFB+1I0po64NpXoE9te/9SEc5VOFLUdXy8LQQ=;
        b=Hlykg56bW0qPjIVkG55QeucvD51Dbgl8qdYtcKz6qHSHcMKXapohRzHubjMF+V/Y33
         yKhjDas2A5meqATVpxX/SWCAjI3TutRV80arlyptwINUKC/iRwxbJW96EphIe+u5o8H9
         8AoMJnBAKChAhFzq6no6323H3hae9H9qete+fOhcUqPscOKZgceqDIEKIKrmRA05v0kX
         BiB51oBGVfOJF+GSaSeV2+zyytlYsnrG2uXIgRdYtMhD6maxnsQXpFHpg6h037sc2Ww2
         v0JvGnaR3kDOsG/NOZY347mfvvbpwx7NQeMy4c9b+kmDZUmYZRW7/Tn3u0LpnE4hKiMp
         SecQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775251449; x=1775856249; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cs3nAqRjHjioxjYHhaJzVFtzKHaPCe2OYhO+RwJxfGQ=;
        b=MRoXO55O/3wKUufhV3SSQkDEWLLF7sw+4UaSow6fSGuPaqpTLL3joUlLfqAIefncsx
         hmOOuDT4NsMh6dbicranaiy/KMHKd44INZdXmVsvQHuWkn8F+q/6PSTEtHh3++cj1zEz
         ixtkye5Hb5iHk6KcFg2z//zaU2mbBWJAVLQCwPEgLi3bGjU3P5aMJdbIfgQxXNY+9tQ9
         WqUHSj3kWddcy4W/sHeiIeiElH7guUfjdPJa52bD0j9qx0DcytjHoaOFFCcHIi6GoBc5
         0VzPPCPs5daxSp4VG2OJWfXIkOmRiKr3k1PE0m6AQTIdKb6WKdMxBPlDS5SU6ykcKSvF
         QRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775251449; x=1775856249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cs3nAqRjHjioxjYHhaJzVFtzKHaPCe2OYhO+RwJxfGQ=;
        b=Wz9/s5KVr/5oI6rpS21jNez8AxoDdNi4m4fAwjlz/CL8FYVBkm9Nsyjo15kjZFd930
         Q2EZbnEIcZ1llxoVkTFX2UsIIHQCfmjSAdpnCzJMfVq99Km3l1NGmEcFdR7ln8dCi07I
         YBlPn4O8MNHpSjhAL3b9Zha/6X5RQGpeoafWm/X5aTKQ82BZxw0opad0vXJrbD5/3Azy
         Nw9hdEkhcutYBEhVILXt15uW1NSQLG3Ae0SDH4paXuQTuV1UphQ2iky2bF1JqA6pYoCV
         30q82q2qx5d7myVG0J2zTgKMItDglgZh+TGLdxKhmhue7iaJpi/G3dzHJk4WRLD4UQ5Y
         EhfA==
X-Forwarded-Encrypted: i=1; AJvYcCXbHV9PmPxH9Gwp/RnlvL5kJhbopVDeCMw4gEW5p3P996eN64+C6sKMhxaKapXdyXGGFls3UNXv4vobtHbsVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEN2CJYAk5JXsxUFVIqmxejcDEMrl4ned6CqQws5ZcZyd/MQdn
	fqQIpT8PIMscUXm2JfHd+YZqq0pPnnzqTuvNgdYzo9nuHL0DuICAfE8aLxCzSFut2EfMM6qJfE+
	5a/Hc2jNOuhq+A+QontrvPQ8xUI7YUvI=
X-Gm-Gg: AeBDietM6dOJNGf/IpfFmo0307T/xVxBqAjJpOhKD4FFvSwAykbEe1anJS37axZWYxp
	UO37uKNxf1cLIu7moZGjx6rDs1UWn3FtDT4x0tJSp1gCadbNsEKXllZ3wveVacKodIHTd+VAnYb
	/ryHtG8Ivna7G93GoNAZcDgCE63tA/O/UaxbG6mp+9aMyOtnhNphvpsqnwGC6y/aCDBXOVlVnw0
	QnmygvQbxtgKvzN+pgQ/AyKOUzjS5s3DbWWOeCgjFMhdQ/UqqtgMGDa214pEeDRf+737Nx6PSvS
	sbsDyZ7I+jFym0Rphse01PzGwbSET3mKrap+hW5BLA4SUIlOk/M11IETkq3VjtNs4F5Q3frRgMS
	pHcz+S4GLvEHb8ZCTsqb3+Aw=
X-Received: by 2002:a05:7301:d1b:b0:2bd:db75:c28b with SMTP id
 5a478bee46e88-2cbfcd54f9bmr1105240eec.7.1775251448669; Fri, 03 Apr 2026
 14:24:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331205849.498295-1-ojeda@kernel.org> <20260331205849.498295-2-ojeda@kernel.org>
 <CANiq72kNqmGpFurRy2X+a=9fHV_hxpfWBJ-+dEL_qj2daLM8ww@mail.gmail.com> <CABCJKucPKB-ntYi=EzPqyypy0kEHwnZvEvCEyjdQUWqfeAnGig@mail.gmail.com>
In-Reply-To: <CABCJKucPKB-ntYi=EzPqyypy0kEHwnZvEvCEyjdQUWqfeAnGig@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Apr 2026 23:23:55 +0200
X-Gm-Features: AQROBzB3MUuJJ3FThSbyL0_qVKcvYvwi_z1x37J_iBtfZ4z7dOAlfjoh1a-7qKA
Message-ID: <CANiq72==CZDMbjq0VE1e0ov7uLoSDBs_g3TR8S=EfsyC-m0mUQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: macros: simplify `format!` arguments
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Aaron Tomlin <atomlin@atomlin.com>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 5:53=E2=80=AFPM Sami Tolvanen <samitolvanen@google.c=
om> wrote:
>
> Sounds good to me, thanks.
>
> Acked-by: Sami Tolvanen <samitolvanen@google.com>

Great, I have added the tag now -- thanks!

Cheers,
Miguel
