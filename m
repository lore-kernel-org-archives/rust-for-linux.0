Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496A03644B3
	for <rust-for-linux@vger.kernel.org>; Sun, 19 Jul 2026 12:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784463493; cv=pass; b=mpOFAbo6Q0ojIns/IpVd6Q79xBvk9Jbhz2uYWUfdLonOz2qOaoidhNYmUJT0UBqM8aQZ5XYFTV9uL4plIRl+XpZY7rzddDP0OFcpnptY0u/jvF1n66JRBPdrTrJOrmQdjSoivhP4vy75IzGcHvrFDtlh/QttW74S7XqofmLYrvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784463493; c=relaxed/simple;
	bh=5eRWuCGmg1GBxCD2QshKQ0r/u4P4BGxvJkx7aLzPclE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FAKQKq73EBr4mmERelHaA+eJ42Sb1q3jSpZs5ymbNfTrVTLCBNsc2Q46xVdC7qW40cSCHP3qL5SBvrJ0Jb/TjLgUEtbQDO5dnVI1W/ncUJoXg3bLywIbk/dYK9wyxgKrf+7781HkOFkqqppE6OH75zI2Ib02vUovwu1eETULn2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6NptcRA; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6NptcRA"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ceeee8c46bso15198045ad.2
        for <rust-for-linux@vger.kernel.org>; Sun, 19 Jul 2026 05:18:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784463491; cv=none;
        d=google.com; s=arc-20260327;
        b=nMVFdWWuKHV4lJxTFs5EZROyhjhpJGdD3NcWJVINaoJqOpInGlGcQb2fSNmfFHlfi7
         VcIpTs/u1UPjjTJouwT2SCx5eG7WFAJgXF2nDYfiC9UMqwD4fNeaQxN1rHB+IMPqSXVD
         nLp5X4iLlMKMd4d2Yo7w2UBfzGQpKp156zGkVYABbwLay5Xrn2XC5fIVobTyzxl7UB6C
         LJOoi77tjzWXnFSNXk5E9CTzeM1ncQ0tbuukMyiIHbdf90yEfvqH+WMjVe0qhCSbEQ+k
         iYLLTAqHJBN0A1GHw/maQ87ejU3mTHszPO8ayrqGfrDmEV9cQ3nvRHrmdXzNzxOhC3pi
         Y9lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BlnttfHKMDtw2Lo470P85vcTNKgjwEUw6ogo3aZKNIM=;
        fh=XE2agvDjrYvp+I9jvIaNMNiFS62wUanHEE8dxnKdFnY=;
        b=oUW+hRCY44LQA3Swk2rVmU9T0d8VDJ1kUa+/ybse5I+pDJ+lBuNZ+1EzELnSe096G2
         Y9lcUfxUQxmTdvJRWgQ6PN82IwWGVmwI1EsZ0rdUi+MrPwIHjIOjwKoUPpeKwiDte5mx
         94QIpnsSHcwlDitAK07s/9VIgaKKu6SuE7H7E7n1Hrh2W+K6AlX8ReR9GdQJy4QCjXas
         wifb4RlJ/+pnkbJEQq6RLnSDGZQDSVKLAQGTBKxyF74DjVs691gCY7kDDbobdIiaXSAK
         bFd1ARX9Lbu/tEsbYwuwHH19sXmyhYozJFNXcx4ylWjB99JKpJBiuN9IpLNqf/C+1RLU
         TrQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784463491; x=1785068291; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BlnttfHKMDtw2Lo470P85vcTNKgjwEUw6ogo3aZKNIM=;
        b=j6NptcRArMhxuJCCTrTjpos3/99x0vw61szvzHVOO93344qu27SMgSWMi2545xPUYx
         dh53lUwT5Axk1APF6A8LFdl/UewX2iQcZCvOM4SVKr2ZyO+5DvoBF5NEG9JOxFHeHWif
         VoNLeQBIERL78IcT+rFCi8wnj0zfS/MQ1sjcvjJLbCsvd/o43oQwHmJEOP+kAN/YOAxT
         6BLK/dWfmyjbikMDJr4a3qI2AYo+eoFGvXbY4mX4+DrwnYB2TJckoMBsDgdeGPsATYQV
         MI4JA9CrfVMSSiwBLqHaZpKAbp+dsglm0tolwTYpRQsGoDf0NnrZfDT3OV93iXpMY8qU
         qh2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784463491; x=1785068291;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BlnttfHKMDtw2Lo470P85vcTNKgjwEUw6ogo3aZKNIM=;
        b=r3GxFhI2/fE1KvJmAoiZ1GtZSfYGXmK3/xVgWKNsSj+g5DgD5Fi0DyIjnvOJPMCPw0
         SJuKCA49FjDnJlsLoiwO6SbN5zqf0e0goTwkpH5vl1/JWds5aBsRxsG78OauKhoL6vkd
         Y66z2pQ35zxYpRfpwhwvp+MPFx0OyEZB8LVk4wdcz6zaFaU5BbjDNjMeWRyQXK0Zai6O
         1K+tzEEssZz7HnnL9p186pb+MR6CT2MR0InOflm1UYmb9s1LFLHIWjh+6JPb94CADkKt
         GtHsKJnM+USTXgcKShUq9ta3pjPqpgEUmrXerOyPhFgevWG9qLhENwH/r+vsHB73d6ek
         5VGA==
X-Forwarded-Encrypted: i=1; AHgh+Rp5lWosEja9IVARE/OKRlhK6JT4KFhmSZLVOcBGxZo+VKQswHcd2WiaDquhnby1lsso/gcgVwl8JnqYArHUiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn3TGNIyB+xBpxvwRjOgj7o+T6EkVwZrvxYNsm8uwutelCquhZ
	gbSkm+9QNScmaC8eFz0QHEt/feAWOmK7ibz6mfKHG34cob+4Jgy2VPuNs6hTrF7irw+MXJSkGoD
	yDwOHU56hpgwskdSzKmF0oZfPDQdwF1Z0taofW+A=
X-Gm-Gg: AfdE7cmx32euaCFyX2r7DTySiYdgZ0TeLitpXPxeWdn64cU2XndKdQm1X9Us+GbwqOT
	pQ1E6Ei2Nyn0wyWeo8Zhcx4T5nzwbmyRbRrkP9ca0Re8PPqKY8TbpYGC8URw0Ba97Ut6pje9Ykk
	wxmwN5EzM2sNT9HNTbJOZdXmQQj8ztpsPhLF2P0Hv4qtarhXReArcGMVcCVsd95Vz5fmgYVZ6C8
	fzUriPPVvk1aBbV9iNdbSADViZt1OHV3XIDmlGer33Klmqur5KjwaXKC99+dJ9PJSJkvB1EWOiC
	/7KTKVNJYbNWEQMYlESmXverBrJ8ivxWv7SoaE/E+z0uDV5Rpiy1Fx8eJS/wZ8ob/eDTlCxOIaJ
	aWEgPUKycMEGC
X-Received: by 2002:a17:90a:c7cd:b0:38e:7069:7117 with SMTP id
 98e67ed59e1d1-38e7069735emr1372386a91.0.1784463491556; Sun, 19 Jul 2026
 05:18:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABwQupNfMAJOGqRM9ke6tj4f53dCCsBDKU7Vp+zf8mwk7bqt8Q@mail.gmail.com>
 <CANiq72krLhYi_vQJjKcEhiQP9CHwc-+d=iMZocW19+MqfW3qwA@mail.gmail.com>
In-Reply-To: <CANiq72krLhYi_vQJjKcEhiQP9CHwc-+d=iMZocW19+MqfW3qwA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 19 Jul 2026 14:17:57 +0200
X-Gm-Features: AUfX_mzrrmVbu91NDBAVw6A73Dbpnj9vExdT_84qKFlgveGSqvngcOH10KWxS84
Message-ID: <CANiq72mj+A4PujCsMCWErASkQbG-ieiXqUpQfozBwhaVgWmV8g@mail.gmail.com>
Subject: Re: LLVM 22 needs bindgen 0.72.1
To: Burak Emir <burak.emir@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <alice@ryhl.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 19, 2026 at 12:02=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Updating the toolchains would be nice.

Wait, we don't ship `bindgen` yet in those, no?

i.e. we discussed doing so some time ago, if I recall correctly, but
it is not the case yet.

Or do you mean something else?

I guess you used the instructions which pick the minimum `bindgen`.
Maybe we could add a note there, or simply remove `--version` to
suggest the latest (which could also be good so that more people test
the latest).

> I think we can easily add a
> check on `rust_is_available.sh` like e.g. the one I had before commit:
>
>   ae64324ad5c1 ("rust: rust_is_available: remove warning for `bindgen`
> < 0.69.5 && libclang >=3D 19.1")
>
> I will do that.

Done:

  https://lore.kernel.org/rust-for-linux/20260719120514.159914-1-ojeda@kern=
el.org/

Thanks!

Cheers,
Miguel
