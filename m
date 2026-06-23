Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9903B1C860C
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 12:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782219047; cv=none; b=GonJrwNmMTHibfsFq44A+f0HKAXpc1m0kWV/GwTCUkP/Cpg8UA3rlmzMd7YRtu30Pq9V+ySgS7TuCAxHymV9AWuKI+efpiqjhH8KLq+H8amJ2S4kKbI4IetMYnNPhNxtyqFR1LmwK/zORjhJq8MVPvBpynTUHS7mlkeDfgM0+PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782219047; c=relaxed/simple;
	bh=TOUR2POP2vlf8YUNKv3dyet+eahX6OSdriA3fkqSbFk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=YBKPSg4G3kZ+me5rjbReO5XHbhWo9/L3XaWqsdQOq0xrGyfFcHM6zofsXw7so+rHcXNC8q8raBLCpQEh0H6C8ejeDtZaGc1HqLBBH3loWDLrTfYhK7ZGMFm6l76bEQk/XHm8dBqYBfBLWJ7WcvENW+yWK6MrgiVnm3zvakIUr5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fKGLSyv3; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fKGLSyv3"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51778069c31so46130141cf.1
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 05:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782219046; x=1782823846; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGj3g1KCk+kZNll4UB6dOm+IXncrIJjrxvMy5Ft1TB0=;
        b=fKGLSyv3WAwapW1B1sMb8NmFxKr/aESUBN4etHbZL4N0r+icxpOEAh2/jSLwra3+xX
         PjAwTK6xLco0YBSEb3MmqqNSqqDNxmGjhv3y5IZnkTLYGhY0O+Pmpwhj+zHH1fwvtdAT
         vE7jlw7mnb/XM5VWj+Qzl0SW5jahNbmam0FmRXxG/2C3KjyMf6sysy0lP+MAlNUZF57v
         SXFetQbOe0uLBk6MJ7MUe+ByNyqQdmK9XMkaLMOySb+vxxYBOzs5DzTre5I9aYhQmPP9
         K7X3AvnrLjekz7fb4DGUYZboL+qEgJP5sDzQTbwBQu0plj1XaODVntCOyt2+IU/7kju1
         C2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782219046; x=1782823846;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dGj3g1KCk+kZNll4UB6dOm+IXncrIJjrxvMy5Ft1TB0=;
        b=SnnvTcVDhfOBfkR8QIjFlvPVPoNog5JboNUK1QZC9im3l9XyQMhxeyZ6CnVM6Tmb5h
         +Dn6ceqwyAqJveEDs02Znys4q7s8pC29gz7ZssE6aXYA9Z5Aip0fA+wy2vJdKiWJyQ7G
         3kwA/GEXPEIozZAazsLTJ3CwU4nD1z0Iqj6aJISme7BDo98O9pjEfUscvGrXagOSw2fb
         Zs/Nv/bOuxIfTprgzINFM/suTYa6lol5qStabyIsiutuUAScmEvHVTC7W8CTzP2K8Yq9
         JLVSCquslk/Yie7OZnkDq+ycNcqyaor84Kht5gru56n3xCPvOjdRWByYcn8PDuxy0LyA
         ukBg==
X-Forwarded-Encrypted: i=1; AFNElJ/6sXgXHioTonwVVECPQcrdPPsuN4MY1qw05kMtgu+iW05QYnxi8CQmnvXwBeg971jaPCCAScQ8yKF/X2c4ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKdKvXk9O1NItMcXGVnHCJ30nUqxsm6LV6vF1hqxtDdN0q0mQu
	43v6g/KUMb4VzHRWUiUCNFixsuGKqOF4FIyXYNT5djcUzfghlB+7M5E=
X-Gm-Gg: AfdE7cmBtZtWrQROENVrGtWtj8MEa6v00blU2roV5cneXz1bW3jIU/O7NrWVoofNmGM
	X15W8OZu8fL1gSBVbkpb59d88RW79dy3VHFl8R6ioA8+s+M2EGm0aKFVv1U61uSjOLcRQiazrrw
	9fS1ook3sXFWhaTaFlQ5tXPJ2IYMsgqEEBN2toKWelB67rRZ1mgmzmIQCImVIwk/j3VDgqlV3Tt
	3ETO9VQOsrTik5HuWcuRJxfX7KV921Dmo1le98tVCJYhts7MfLL1SsT6WyCZs/vml6TVIRsIJG0
	n2nK9T48HwDLAhWQ4DhuS97ZAHQhE9llBXic0cHtS/PzBZYhkGCvz92dxdUoKIIyZyQJI7uCAM+
	zjalq2YrsXTFcTkjrDln+yBYQZfH6SKXGZWdWH4I1jKrwzNgivQgUvBhdYhBZpxKnqhssHpG57h
	xT1dk2rUmKcaZaTnKGmcx/co4FGmxtqyje4M+uMtVT7+sN/fBY
X-Received: by 2002:a05:622a:408d:b0:517:917d:e3d7 with SMTP id d75a77b69052e-51a54807d1fmr37051071cf.28.1782219045378;
        Tue, 23 Jun 2026 05:50:45 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a51106a09sm22340861cf.0.2026.06.23.05.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 05:50:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jun 2026 09:50:38 -0300
Message-Id: <DJGFX7B3FJJP.3CI7CU0US8FYB@gmail.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Shuah Khan" <skhan@linuxfoundation.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Tamir Duberstein"
 <tamird@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-kernel@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>
Subject: Re: [PATCH] gpu: nova-core: parse structs via zerocopy
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Alistair Popple" <apopple@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260621143647.264770-1-nico.antinori.7@gmail.com>
 <ajjj1yyMcrCA8H19@nvdebian.thelocal> <DJFUZJYZHOT1.M74T83PJE8GM@gmail.com>
 <DJFVRMR67B0W.2AJBHU1PWDPFT@kernel.org>
 <ajnPpyQcirSDIZTu@nvdebian.thelocal>
In-Reply-To: <ajnPpyQcirSDIZTu@nvdebian.thelocal>

On Mon Jun 22, 2026 at 9:23 PM -03, Alistair Popple wrote:
> On 2026-06-23 at 07:02 +1000, Danilo Krummrich <dakr@kernel.org> wrote...
>> On Mon Jun 22, 2026 at 10:26 PM CEST, Nicol=C3=A1s Antinori wrote:
>> > I did my work on rust-next [1] because drm-rust-next does not have the
>> > zerocopy crate present yet [2]. linux-next contains both zerocopy [3]=
=20
>> > and the new users of transmute::FromBytes if I am not mistaken (BitTok=
en,
>> > PciRomHeader, and PmuLookupTableEntry), so I can make the changes ther=
e.
>>=20
>> The drm-rust tree is a bit special, as it remains open for contributions=
 even
>> after it has been tagged for inclusion into Linus's (including throughou=
t the
>> merge window). However, all changes staged in drm-rust-next are not goin=
g into
>> linux-next until -rc1 is released.
>>=20
>> IOW, until -rc1 is released this may or may not resolve all conflicts wi=
th
>> drm-rust-next. Once -rc1 is released, it is backmerged into drm-rust-nex=
t and
>> drm-rust-next is picked up by linux-next again.
>>=20
>> Usually all of this remains rather transparent to contributors, but you =
hit the
>> case of using a new feature introduced through another tree before drm-r=
ust-next
>> caught up with Linus's tree (which will happen next Sunday).
>>=20
>> Before drm-rust-next caught up, this patch can't be applied anyways, so =
all
>> good.
>>=20
>> > I am fairly new to kernel development, I apologize for the mix-up.
>>=20
>> No worries, you did nothing wrong; thanks for the contribution!
>
> Yes sorry if I gave the impression you did something wrong - this also to=
ok me
> a moment to untangle as an experienced contributor so perfectly understan=
dable.
> Appreciate your contribution and hope to see more of them in future.
>
>  - Alistair
>
>> - Danilo

Thank you both for the clarifications! I'll wait until the backmerge
into drm-rust-next happens, then I'll rebase this patch along with
the new conversions and send a v2.

Regards,
Nicol=C3=A1s
