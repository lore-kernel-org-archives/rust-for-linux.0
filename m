Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5413A25C818
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 13:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770817510; cv=pass; b=DsLWxzU+cLDKvy7J0C/MbpVUN1n3Oub0uNm13nWlwBdwpeb6es6DvgKq708JemwsU2MljjVk6fGVXTNzGJUh038DtFPxZIuaami4ZGcEZkWsCfzPkPsr6mlRocvyr/IG3nyeKUg5LBNxThivVzxV9Y60KO3+dv/vn3LeDnLHXM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770817510; c=relaxed/simple;
	bh=Drcq4cyNV6Xl9YkyzIoBbszY5LUNtzFTQi0BiMX8/TI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dfMXXkHmrgV78mTU9BU8YE17AWCIeqcoI+N8xposNVq1dRf5rBOhfqyM39WJYc8FsHFjFyuiRFWlKuMvMYyle+sGmW286atZd/H5l5aiYfI+/mnUb2StJaJ0d4YvSTPx4xU2ZYHOcI/+/QZ8iA9jNV4+2vGIePQ6BWfc2rl/vgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVEvtK8+; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVEvtK8+"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3870cbd6c40so2143431fa.0
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 05:45:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770817505; cv=none;
        d=google.com; s=arc-20240605;
        b=jtzxv3FrAKzs/L0cqiCaflMTjkqAJOoi4qrDoPjmiHjg5VJysA+oMg1TGADDv/GVOg
         qMtIp/npgYOLvEHaN5KnG/sQ7ts2QPyNuePcYEluH5QkmveeQ4Jfig1d9ua0qRs6jnpn
         cQIOFi5mI4tWDieJUrka8dI0rdQhoJ7ou+fwLZqgv9JNasmxBT1BJyWeJXzl0EhpsJdd
         Rt2aoJcw+qPDo+ELqIaJY8pZKjg9hB+4+va24MvNmLgK/dHsYsMV6RaYejDvz2EqYUIn
         gjQL+6nuTbN8++kyZH4NTEh6SFYrsAoboLs9Kt9ykFGWPasWStEiUYTuX+db3IOW8oh5
         2Q8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=84OdGKCvpeMY9UdM+lMDAnBBi5jGdAPCMt+gUfHZUZk=;
        fh=nYpVHHGzHYmkCVIQJJ/h+rKO9ggOaRWV3hzTPNoMfyk=;
        b=gHA3IbzzQ1i8Lnx2VQ9WlMApH52zsksOZJ5DomDyJ0Ggsq8Jf+t/I9d7RNGzHA0RDB
         +s6QRi82TO6f4sYew/qgzNLZwQmz96JqhVoosV2OHy/wf+jHbAITprHKDZVG6V/nHCiv
         7IgmVuy8YzeKSHQEyDUJl80f/9ahIKMPi8+rVCW2n+d94lxGt5vWyG9OvnNXiaEDgWti
         pQYMmhtzzFAcD0wWtah/UiXRzUTj3QMyHLu4OUZ4PrhLTt5HjCY1iaBXWQl3QFlYbnIK
         zw+00T3ySl3bOxbLJH8OrLsDFw5wAVluANL/PMHGryS7jZNPoGeNEbkslx9476vZYCiL
         fdYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770817505; x=1771422305; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84OdGKCvpeMY9UdM+lMDAnBBi5jGdAPCMt+gUfHZUZk=;
        b=RVEvtK8+e39OOf8noF7LMjm4aF9SuEmwF7twjigV6eh81cLi0RmPbvAX5L82502JjR
         MKatzOHDLwsAhgavQ+M49MWNshYYBM+WpCh/9DwWfezm9sPIsbFu+FJWpM5P+NTILczf
         H5hMxbnlC0tS0rEOACwxuK5pPHNYRPzZ7mLwY9hREH7Pxk33cT0AkRhuLmCl77fuvSbT
         znrX7R2wMWe4KxSIkf7e0CryO/SOtjoHFP7cKd9rPQDmy/siw9i4NVOZkrWnlTJof1O0
         b6k+NP+OxHducH04PN7LtnOWcHTGbjTsUm7Emwdbcr/OWKa3mVhSE/JB6NoeDCY+YO4t
         flkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770817505; x=1771422305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=84OdGKCvpeMY9UdM+lMDAnBBi5jGdAPCMt+gUfHZUZk=;
        b=NNqI2SV7UPdMx6BpfhlCealzaHbFqqf2KeiJGXLJJBqDMffpfjK6pn55ADpc9ir7V8
         7Bs6RfnERNhj18gjBcmAlxq1gO2Xe1CZ1sxK2Lni2Uq6cT/dgsKPTg5YoR96ezxxQXn1
         DsW5Ces0923+uN/gUBX/XVGoMrjCiaimZ1mOBH5msvrTMh5k3YaafBe14goGMHLP0fND
         hxCop78fJWIQFgZnav/H/g9puDdC9LsWoiJ6YdssGdPbbS43PKBU2PSLFK8THftgwYwQ
         xZDdN1Bvvsdv5cWsOHuGqJkNzi1R7HEuBvFg+6eDcG7uC9hMpFBGV60thYIf7ql64ojy
         edqw==
X-Forwarded-Encrypted: i=1; AJvYcCWSVOW6dUPotx/zszelT8/cGk3Qbc9qYR7W5AG/GCV3C0n9wCi6Ip7kaXqp4BidDZynm1llSKc6UWVFXsuBGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEShKJU5Lr3uRcMxCztEBYMKJLXbP3TrJsepyaBtqpiazj38Am
	K/KFWCrQOVLQZPrUD1MJWQFr3Jfn/qOEUti1v6sE67uiucatv5nfcOQEpXWjWAK0eOmZw1F2rj2
	QgTX7SPJdVtq0Zahmt4rhLz2b2HPmjdI=
X-Gm-Gg: AZuq6aL78z0K1ytiE4nCqvB6HHiIFVf4UmzA9xC4BhwJYLCyO5qn5gQ5O83W7zWvsZu
	+3zQf5+ak5wJrgBZhVWWY2o3U/q9be6AslVausHcMoA7YeGxvBDO+qg32vG/Kht2t7QIaL9Cw6b
	LthTeLcIfkWmyS8GknkLy9CaaQG+zumPH43E4Q84hZoL3mt3GAElw9TqjGYsmmHJlJPCiq2atO7
	eC0eR2Woekc5oEpGed/NrnfGKumMU48CBfrzm/reuOrgq7ZsFFRAsa0BPZ/Ftkf9UcjkfZl7TQB
	yqY5rtOyMPy64mggC0t7icNWcFs6nQrzq+aeJBwP
X-Received: by 2002:a05:651c:1506:b0:383:1a8b:a330 with SMTP id
 38308e7fff4ca-387030533d6mr7840851fa.4.1770817505016; Wed, 11 Feb 2026
 05:45:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205042132.40772-1-muchamadcoirulanwar@gmail.com>
 <CANiq72kc_mAko+5S=fEOF0Y-ry7rLyd5a+eC=nZiciUcO3rxXQ@mail.gmail.com>
 <CAO26r3TawBQQ6994h+wDTdiobuT8cwU1jGKDs1mh7HdUp=KpLA@mail.gmail.com> <CABLcDQBjuZc0edQnoD7SfWj8qEH=ciognT6RPfQPO4r7gcODBA@mail.gmail.com>
In-Reply-To: <CABLcDQBjuZc0edQnoD7SfWj8qEH=ciognT6RPfQPO4r7gcODBA@mail.gmail.com>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Wed, 11 Feb 2026 20:44:52 +0700
X-Gm-Features: AZwV_QhNcf_5KypSo8V5fg1Wx8Sm0arROkkp-WGzjyE68hGfUhkMOILe_lFNiFQ
Message-ID: <CAO26r3Rh7WEYrH9ksD3ary=2OUSmYj372iCAGx=VsGnXAN4ySQ@mail.gmail.com>
Subject: Re: [PATCH] rust: print: add safety comments for %pA formatting
To: Shivendra Sharma <shivendra02467@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, tamird@kernel.org, gregkh@linuxfoundation.org, 
	fujita.tomonori@gmail.com, andrewjballance@gmail.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shivendra,

That sounds great, I agree with the plan.

The wording for the SAFETY comment matches exactly what Alice
suggested, so it looks good to me.

Please feel free to include my tags:

Co-developed-by: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Signed-off-by: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>

Thanks for taking the lead on the v2

Best regards,
Muchamad Coirul Anwar


Pada Rab, 11 Feb 2026 pukul 16.58 Shivendra Sharma
<shivendra02467@gmail.com> menulis:
>
> Hi Muchamad, Miguel,
>
> Thanks for the response! I=E2=80=99m happy to take the lead on the v2 pat=
ch.
>
> Regarding the safety comments, I think Alice actually gave us the perfect=
 wording in her reply. She suggested removing the specific reference to cal=
l_printk to make it more generic since %pA is used in other places like seq=
_file.rs.
>
> To keep things simple and ensure we follow her suggestion exactly, I=E2=
=80=99ll use this text for the SAFETY comment:
>
> // SAFETY: The C implementation of `vsprintf` (in `lib/vsprintf.c`) speci=
fically
>
> // calls this function ONLY when processing the `%pA` format specifier.
>
> // On the Rust side, we always pair `%pA` with a valid pointer to
>
> // `fmt::Arguments`.
>
> Muchamad, if you're okay with that, I'll integrate this into the v2 along=
 with the cleanup from my previous patch and Miguel's earlier suggestions. =
I'll include you as a Co-author.
>
> Does that sound good to everyone?
>
> Best regards,
>
> Shivendra
>
>
> On Wed, Feb 11, 2026, 3:12=E2=80=AFPM Muchamad Coirul Anwar <muchamadcoir=
ulanwar@gmail.com> wrote:
>>
>> Hi Miguel, Shivendra,
>>
>> Thanks for the heads-up, Miguel, I'd be happy to collaborate with Shiven=
dra on this. Hi Shivendra, I checked your patch and I really like how you h=
andled the documentation and the C-header part. It=E2=80=99s definitely cle=
aner than my initial attempt. That said, I just got some feedback from Alic=
e Ryhl regarding the internal '// SAFETY' comments. She pointed out that we=
 should make the safety guarantee generic (covering `seq_file` usage too, n=
ot just `printk`). How about we combine our work? You could take the lead o=
n the v2 patch, and I can provide the updated safety comment text that cove=
rs Alice's feedback. Let me know what you think.
>>
>> Best regards,
>> Muchamad Coirul Anwar
>>
>> Pada Sel, 10 Feb 2026 pukul 22.00 Miguel Ojeda <miguel.ojeda.sandonis@gm=
ail.com> menulis:
>>>
>>> On Thu, Feb 5, 2026 at 5:23=E2=80=AFAM Muchamad Coirul Anwar
>>> <muchamadcoirulanwar@gmail.com> wrote:
>>> >
>>> > The safety comments in `rust_fmt_argument` and `call_printk` were
>>> > previously marked as TODO.
>>> >
>>> > This patch adds the missing safety documentation explaining why
>>> > dereferencing the pointers and calling the C `_printk` function
>>> > is safe in these contexts. It clarifies the contract between
>>> > `lib/vsprintf.c` and the Rust implementation regarding the `%pA`
>>> > format specifier.
>>> >
>>> > Signed-off-by: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
>>>
>>> Related:
>>>
>>>   https://lore.kernel.org/rust-for-linux/20260128202130.196419-1-shiven=
dra02467@gmail.com/
>>>
>>> Cc'ing Shivendra.
>>>
>>> Could you (i.e. both) please coordinate the patches, perhaps merging
>>> them into a single series? You may want to use Co-developed-by and/or
>>> have a different author per patch etc.
>>>
>>> Thanks!
>>>
>>> Cheers,
>>> Miguel
