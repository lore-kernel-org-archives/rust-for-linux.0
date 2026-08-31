Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652E23E00B6
	for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 09:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169856; cv=pass; b=I8GIHOnAjilbyufe5FlWmobiiTbJuBkkjKYQi1X9qQnZKRkzws2/6Vx0EdaslsmJVJBO/BS2x4KwzyD+roZlYzSjYnkzlTCv2Cs+nnTGX8sxVi9WV6WMQgskGsnhi4Uu5q01VHMVNjKLUUCJMVeRyrU51O3yYQTJ3FlTclatsF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169856; c=relaxed/simple;
	bh=RbuKONLY0/S+AJmxjQgwpW5xe4SNlSbwc6Tzv4DTTPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ji5hOknhEad8TJleICWerYOaUGxNz41+OO/DvWUir16xZJjPso/+7yg6ulHHpM1tLIWTQalZyNgv4EqcQaiM9cP5X5lnxkBc/xCBtMan0NdJCE+iRIiqBaJs5lijdWM1cUeoKe0FT4UikzYvwzdjU0y5bCWC3eGcMdj9C6AVYDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NU2Z1aF5; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NU2Z1aF5"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-398b21b02f3so219311a91.0
        for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 02:50:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788169849; cv=none;
        d=google.com; s=arc-20260327;
        b=QBDVduvnJrXufW37uFJ6oI/8pQ2Azhd2yWC1JvZAWgv5k36QZzv89J0oGuiAFvWTIn
         HkTM+ZvaIFUPguvUu6m4XK9I/XFHuiC04y/CV+wiiiHus/jwxojr9u6bpQGNyrie9HSQ
         N3Dpc5G+NYdAWOaiK9Lms/PTd5B2hcsrJ9+GRKH72cdH+SL0XxVC7t1RRYp9ll+MmNrE
         59rkCQDkUGPQMFTT7HZgIZCLp717cxn2mBWtlBCSXaQm5q5KNIfaiCqicurg3lmfUUqj
         yVRJYx2uoxHzFklpRCrXPr4K17aUpWPRXDht0IEmrt+Don0ynAPenqFskHK3jNvcpkeM
         02PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FoMofcxx656wkcjtt08BKv2Pi44P6R9nDoS9NYe5W5M=;
        fh=LOzFl2JJlJ+4tVJ4BAWsuuIj26+0Bz9XJZGwvlDePDA=;
        b=aJtPczP/bHniFKBbt0POozjTzLt7vBBRpyMdJQ2qH4CJrO/9ibtHmXnhsziVXi681E
         J/r54AGZnDoUCicdGGjdFAl6nJNJTf67g+WVek/31jgKpG07OHmWc2ZBKOvgQC58I7LL
         mZccHolH362m+tJ8bhZo/KituLDBv/JX2RcS7rxLgIFL3ZeTIJB0YQgPr5rSEEedpxzR
         sDlaXuBK3NsLiNtU4I7/r9AmYWQ7MAffqW2t+23M8vajL+IJedleLdZhL0q8bCfTPoiu
         KZW96USW7d8mzlxfpqnQ/ZLDNwx68m0dvioooXEpiB9doeLV9ysWMmUkjgzT+KMQyXci
         N1PQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788169849; x=1788774649; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FoMofcxx656wkcjtt08BKv2Pi44P6R9nDoS9NYe5W5M=;
        b=NU2Z1aF5O2lfgwnc45eA/Drx5frvK5AQLzWrlmtFEvAvAyWjXiRVpHAeRZu/hWJiNy
         RMu+JqR13htB0X/e9aLNdMO9U1+8vwV24lZL9bx4At8zi2C3s3AGJ85ZuqQ4/9k3Y+Qb
         sXZRAWBX95JFFl46wQOkj1noKhBKomvfV5cpH3HIz4gUjS/n1YWI5J6Ww+UwgxT+8RFk
         lOB65F0iVVdf4e7YzbZIgnu5w4Ri9sYUUl8COaEfhpA9DEW/kZRE7KvGR8ve0gLNgA0+
         I/sw45EQZDZvV7bKHDvq7MRXzaLMj4GkK2SkvR6U0bk8B+obd0j0RFEwk99TvCRUsaE0
         pbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788169849; x=1788774649;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FoMofcxx656wkcjtt08BKv2Pi44P6R9nDoS9NYe5W5M=;
        b=MPnrneXruqPoj2+nKQCaaaXa1ArYy+Sua9dhKQgUOIOFLfZOi7z9NKwIzX3bZxpLMU
         P5Gg9mcSCWNWLs/ykKdeZbybKg+/ZWlG9KBwtxbTpmMn9aTmwPdbP3A4yiOeWcbwzU4A
         sFRim0bikxTwgeUBUV+dq6reI2hfWkCko3zJcUZH8xYvrWl72bKXAIfPX7OueZ/cuKtx
         5CeWei4pL89jrfi1Nx/88wJkpV0+nAcXb5ay1eogNLP6Eqk2KHaHkAwm550OW2KPMDIx
         to/66iAw3xA9dSpQPBL1Y/EUjT4d9XNvqXzjD7D72/eDnVl+kSBeE83xu+glGQInbmVt
         jiMg==
X-Forwarded-Encrypted: i=1; AKwUvBxZIvwTo2zFQSKV8z/yhMj5gBIzByliHYB2hdQ7nmOBrUWXCJVg59khPRmVpFBJI5o4+LbJhuOd2cKjX6HLpQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nT19imzb74Fgl6keJsmh1uT9UZdQOF/2uFwoRdxJr2MhgCe3xD
	L5ee53EnP4xWP3Bws10muVMSj6CXQqPuBzZZ64OJi5m1HFspTdIM1NjSLVN5TjWn2kiFkrmL06J
	Fz5roZU9OvofpDRwBoZBIGMlZvYVNvpo=
X-Gm-Gg: AYBFou3bP7AzLrxio4KEEUqpMF6u0Q05lerEvauWhqjJf9AcXPLNUeIFlCl+2WarCfD
	wEoBdsThhnP1mfd0+DLoSzuCK/cnTbeT2OSbNv559tU7bWhdHyg2ExFg5prp1ymjOM18/qcyBvw
	OiM33zGufV8/H9yU4Xv+Y/2ozIDPGu1Z0CTEqkYj+SfGggpwXOCl+szrcudJqrZD0SdK0DvvFst
	+541c00TGpSnbTSK1tMKQODxV3aTBWy3+iLTW/199/2yN9jHGqrLhbe5OPkZ4PDa6gOozYJSDZe
	goWc9oBU5SCl7AZj6vXUDcCWed6qOMWKrkpkGKNHpVmFJA+/MJRvnj69SnXVvJQA2/nJReC2XS8
	Y2I/EPWJh1sD2FocYR3adnJVF5o+VKQE1CHbSs0dwP5uGln+LguTF0yMrS1U/
X-Received: by 2002:a17:90b:4ad1:b0:38e:76f8:fcbb with SMTP id
 98e67ed59e1d1-398bac28133mr11638970a91.4.1788169849364; Mon, 31 Aug 2026
 02:50:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-fix-pci-irq-vector-index-truncation-v3-1-a2103084d20e@hotmail.com>
In-Reply-To: <20260831-fix-pci-irq-vector-index-truncation-v3-1-a2103084d20e@hotmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 31 Aug 2026 11:50:34 +0200
X-Gm-Features: AcwNN1ViyddrDBit2qWlifkamMcobcRAYSEK9R5OBBJcArZIlXo8eUmjUf62r78
Message-ID: <CANiq72=8JgETrNHmoy0gHxPmfipUmVGq14EhjkU6JWYFE+7xhg@mail.gmail.com>
Subject: Re: [PATCH v3] rust: pci: reject out-of-bounds IRQ vector indices
To: aiqubits@hotmail.com
Cc: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 9:17=E2=80=AFAM Sophon Z via B4 Relay
<devnull+aiqubits.hotmail.com@kernel.org> wrote:
>
> Fixes: 2fb7755b0a7e ("rust: pci: resolve IRQ in index() and embed IrqRequ=
est in IrqVector")

The tag looks good, and there is no need for Cc: stable since this is
from yesterday's -rc1, so that is good.

Nit: we usually don't do newlines between tags.

> Signed-off-by: Sophon Z <aiqubits@hotmail.com>

Is this a known identity? Please see:

  https://docs.kernel.org/process/submitting-patches.html#sign-your-work-th=
e-developer-s-certificate-of-origin

> +        let index =3D u32::try_from(index).map_err(|_| EINVAL)?;

Do we need the `.map_err()`?

Thanks!

Cheers,
Miguel
