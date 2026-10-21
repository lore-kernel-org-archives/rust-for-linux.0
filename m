Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792576183;
	b=UhoRwD29CeRBbqsYJg57p1SYU1lxaEV26d8ezuJDcnNkcNZksbFEGKrYFpysEbWgDK9s
	 tO17If2KJKlktXDBFXBCOKhEGsGQcKqhX4EvxxlN/OHstZer5kTjuTDzG93/8u0M+NyJL
	 /8vK5E0vFC4MxXOBWHtLOMDA9UTiik+/8Uz9Sd6FEu3JcmGNnLULvnLK23CeJrSsmCJzf
	 86RAFiyKurt3BdC89GxumPWPAxAf7l+gB3RHIPj0h5A1xzCY8gO69x2P6ylJ1ESi+eUX7
	 ImGrQJj/VF/97tCDKR+8dg0MCIwNJd4GMF80LxHW93i+pGSz/o3ImURKZhg3HkUp4Nw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=faYNvyvtFmrvw+Wny57TNl3SC6WYxFrVMEzfADf5rF4=;
	b=P4vr+R70gedSNJ4ySHYToOlEMSrHpKjZmm3TkWdurxL4h/PtECA4cQ0Htfp/+LToWqjt
	 OrQ3999ibqil24O1OCwPtEjk1UJPE9HogSor3RBoqoguMCbf28vHJG9j1dx5h6EMaD3vr
	 iyHTTFwixYnozChe8w8t70wakLpn0hMOcKlC8cd1aK9oxjQxRWW81gCdd7QWvLMq/R7Y9
	 dmJb9cJqiOZmcdWqiTEjNA+R1i4WXKgVrLMVEoIBoAVFBP2kR0+UJ/LOCM9duCYPNKWqM
	 KVnGtYZNwS53MamelppWmPl8Dc9xKGIWhzQXftXXzJnrctLxpvJnAbL1D7gPdFvBiyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cUiJOXLs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01576606A31B
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 09:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01576606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cUiJOXLs
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35ca5244753so52230eec.2
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 02:49:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792576182; cv=none;
        d=google.com; s=arc-20260327;
        b=Vx2R4tA9v/xxYx2x7uzFMpqe+bYQ5vYLFKWcia0Hsxb3njHwK4UxU0AHR6fek63RPk
         jDehq60xhqUq7bEAl6lxF3Jwfy8dcEt31rogH97kRsKfaN4wViq0PtUeg8iNN0bXJFeH
         mnpl1hnET0TMmRbQm7vzcZZkSW2dLw57cWb+Qex999HPCkbDmdcUOzxNT5WkzRvJqghh
         QC7aCKEsT+qCxV50zhRY6t3366EegN8aWkWVgwsJsu63w2qZVglt2Ut5uicJ30xCUf1L
         icFW9cbPB/8+GcX996dVa3cfGjouuKEamuL6YPyWHn+6M6fnCgesJR1FTUvR5eiPrSWC
         j8ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=faYNvyvtFmrvw+Wny57TNl3SC6WYxFrVMEzfADf5rF4=;
        fh=gcYpoIuEBwB+eR5aCP4f6p89zhUu/e/S1r99wbw1dhs=;
        b=iKkhYo9idRyyZVFBNZS/OBKIKM7rmVMFlBsZLjuYtr9CxQSNpeNMMKLsSHQHBZOlrw
         C4UnsaeSxrfJqskX1SWOUaSdMm37wCirERj+CE33qMv4x8e5AInxWnm2GwGf0lpxypYU
         mJ5QLfDQX8TneodfkWLmNos/wVPjL6J05KUjFCp4q0cUxUy3trNX2CCa8Wdozb4M9S9D
         5D2d3LHK5RoB+aveHMg2pGvk1j2pj2ZKICaEJd+D26e8pHIQdOVx6dtppFUm/7qjE9wO
         SZiLxckA4juk3QCPHi6C4J/vKols/64HGjnD4vF7jiRxKTRni5TySbSLgWTrc7AlDggD
         uoXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792576182; x=1793180982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=faYNvyvtFmrvw+Wny57TNl3SC6WYxFrVMEzfADf5rF4=;
        b=cUiJOXLsbTK0DX4j6NiAMaxFUmyL+0QkNl4hv7SFUK+OC3YrLFf+ua1vE3CNPTp8xN
         9W25GKN+rN2j2/B0ZZDdpdvzx1IZlgnhUAUFfCp5ingm830euxbcV16crZyNCMuGMAZt
         LtxBpQSzhb4XcnFVlo9qkIbozDVxGg2pXvTwlZtgHIxozI9bS0TGiJbF5yXd7tbS6EnL
         Bt4xuGgI+MWillNTszF48L4IqVI1ulFRz9bChqUqtAqUCw08nTySg26pBCjrbQLdAnNg
         6u/1jVJzAhS5yrQ17BDE+TDrkOO9mlUoO1/4I+Lqnjq1fgSSkGkl9xvFlKKi5+zVcgrF
         UHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576182; x=1793180982;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=faYNvyvtFmrvw+Wny57TNl3SC6WYxFrVMEzfADf5rF4=;
        b=g/YMSlKoh7edgODpKryf+Eu/nctXlPV8WJFGS0ba4lkF9dLAwLrm5OaiP0JM83HVGK
         IIBwg9zS5quNel/doutUYgXyVZZJbltVGEknkzlFGJpEG9RHgVneKaEc247wTu0ZA+wG
         OTaCPRsRExM0SMEg1EjKs5bJyJO+1qQdtNsafAWo2m9AennHmQvL5wM169wrSMcWmLaZ
         P243OcfSVIljM4HE05AT5ypoS364jAQo+ZChGZRlNJ0DdW3NCQtJ0nDmFhHF1jnF/WeZ
         V2OieuWxjqzzXCAl2m1brsJ4etvLs30Et45+47hgxpjPQe7R7sYOm9wA+T2q/AXyDCwv
         GaKw==
X-Forwarded-Encrypted: i=1; AKwUvBzgRy3BHomUlQ8P2t/CthUL8Ui/nleXxzPHSt7F+yiRpa2xiCbg2EE8LylnsNAMzQEva+OHN2cqIKAN9VCSlg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIAUkNffWr0kneFhP78S2XuE2Ip2HqIVW+eRLkeeE8SMGsmjrgv
	8jjupl0bmLr0XFfom6Ux3kqLZwJvZO5FQp1e21UNqDYVAS3cg0uSB8FfrbT8sNxuO5Eb8d5Ntde
	gubEtq3ZAwtbFB5pWbFE+UI0pDtwW44XBEwSkoqI=
X-Gm-Gg: AYBFou23/vP/SM9kW206oBcwCm/8szS20W3rQVWcs/SWhfU0CGGYwzmsoXUSWIAxvlJ
	EMUeU8K/ji1//KGOII4yqokdejnXInbYPegfBQjl/+ia7sdDEWn9fHfGeQLhkcegnGjMbxKanw8
	o7AdrGzPuDgGATMfTjOyPN4+oCh/35ksWnt/6D+TtXD0MqMwJKTnqZwr3bKu1wECmZST7Ggea0E
	Bd/a675brPdoh8hAY4gHccsYH7lpt7LJKisDJlrmrA/IwfMRWvUyXPH76kjjNYvuVh2pxph6QGh
	pO0K7TuRTkTuuFxhHC2xS9WTaqEaGjdVZBH6Vh2An+4zZYPeQAxok/hDhkKAV6CZgxRV5Nwcwlv
	i5TbzCwrCAlQxkJ4CLCN6llIIhMDIJ60o8EH+YAReLEhrFiiWrn8WvwOlRVdA03A8ty5eBqp6Ba
	KgrEYgfzp18bfUMV5Srq8XdBU2JM5MVW0XMsxKmyZJxM7eB9RSkW4HsaymjXw5gEr0VDavYZxoJ
	18JRC/b7ykn9TG3a49TVYsOvLzWCvAuUU15
X-Received: by 2002:a05:7301:1a18:b0:351:7883:bf47 with SMTP id
 5a478bee46e88-367473c9a92mr3626616eec.0.1792576182040; Wed, 21 Oct 2026
 02:49:42 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <2026101318-stingy-crescent-b47e@gregkh> <20261021033257.1359428-1-cmllamas@google.com>
 <CANiq72nHP4qiHE1=y2nhF5en2r9XAR40AnTUNWMK3uPmGuENWw@mail.gmail.com> <atiKAh5e4BjYgHSu@google.com>
In-Reply-To: <atiKAh5e4BjYgHSu@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Oct 2026 11:49:29 +0200
X-Gm-Features: AclHuK8jsDBYq8x6_V8-Veuo0XuKBo2CyxF0S-ifysZ_t9kkS9i4m5o8kgmTKmk
Message-ID: <CANiq72=rN04D4EEL=cR_BvZpeTh3SGEdQ4YpFQLF8+u3rvyzjw@mail.gmail.com>
Subject: Re: [PATCH v2] rust_binder: add state_hashed and transactions_hashed files
To: Alice Ryhl <aliceryhl@google.com>
Cc: Carlos Llamas <cmllamas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 11:46=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> The version that open codes it is probably what we will cherry-pick to
> Android's kernel branches for now, but we can definitely look into how
> to best support non-0x prefixes in a better way.

I meant later to clean this up, not here, i.e. no need to delay this of cou=
rse.

Cheers,
Miguel
