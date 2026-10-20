Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792487099;
	b=qZTmYbxaCGtMwIa8JIuVI3WUblTVkh7V1ODFsGl6jv+WHJAODhuK2+mg6rVNLSntkDgi
	 jCqMh9Br8DUgSWSNGFU4Gx01cnhMjikrKT3H3ePVKyF6XJ7oqCF6DnvQ9qdITkzw6fXB8
	 vWo0SiDPKmtuHZOZVoTS3tNIDqYAQgwvfembd/drmfZncONzWVG5cAASTlsM1v3H+MgV7
	 CK9a239Fo/2Zsir1AmOwKE76v1MIiHrJOX6DlAbMlxMIxThb7kC858tX/Sa4KM1MjAKQS
	 Qx/84c9r6zZub4QQ8IaVeIAPuJzo1Q5fS7BfjgD4JAOJRTzhMMEs9bnTH2zogOv9hZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1EQskYS0D7RQlbdc42q06B8aUfDjbkE64g4Pl0A7js8=;
	b=E7oUbmTyB+++wiCle/oiMrb9bl5a+Y4kTJUnrQOvSKjSU2j2R2VhH1gm/rmGPwW+VV6q
	 EgcLWSIIyv5dLU9K9BknvuHogpYMa9z6ubgDY/VDCAb01B19u5+bnNladLgLTlHbDCQq2
	 p5pU7Mt2Fou+F6eR8ICNHdr1qhOBDReEXxebGWHpa1YRHkAoSfTKfQBLZT7nzLy6HnNMK
	 61m2Ebj88uIyaMaLNhcZNKv+6TsEJDesR5acDyoUGoQMzauwysZ127/bJHUsq451m4jjM
	 szaLFe1HVoXiZBqklw2y9pipeEcmqAm8bhOUuNiOQIcfz93FR4QRzpsqgjq1T8l/aug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=KS1AFbh+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6353606A319
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 09:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6353606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=KS1AFbh+
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so4091845a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 02:04:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792487097; cv=none;
        d=google.com; s=arc-20260327;
        b=fYyJ1IKlNe4orZIArFKN3fJPOWtS2UuJDIlHE2+XbFVJ5mLZZezaoPKPNr2mLunMe7
         VKACq/OWdvCIzoK2xCBG7UniTBoqCphg+0w2PKeVTB7aQOLTi5jwk9HS+yYQzdswmDQr
         Ntf7cc4rUWORCZLzy206Pr/4Sn9BRF/sYDxc1dDphRviImtqYsYgrJjnqNPDh63h7t5O
         ntzxi7+hvcCd4mjQM9/A0edBCMa1MSHSCYwkuvyWCG/LQlw7WttC3Vr32PFVue4aUpZ7
         tQBsgLU9jZBwu99pT/XGau/prxr+3qR14wlAeJhX2FPDrQD/DXeLzxVF5iswn3Iray0c
         JJLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1EQskYS0D7RQlbdc42q06B8aUfDjbkE64g4Pl0A7js8=;
        fh=BzcHP9KRfhzASL/4fU17eGLz9pVjJQ0A711QnHY9b5M=;
        b=CxOYVx/XjIKwCAJHy82WF735KhEuIBzxaRkkg8mCITp+nDWKCd7qhghrlWr0sJYhEp
         UtfQpXwmdAyy+4ZTudiN+1NcCekdtLCM7s4rvesUV/ro+LvCFfUZ2Hzw3aCtSEwxr4eX
         iGLHcJ7El5M7xu8NgniLnPYMqwCfH2WSOQ/g7O56HVCK3oxyJ1ZoWsWqGWTFSYq8nbWS
         tUGb3+MlI4zf375tvIz/mvIVJIatH1WGHoMp0CyCjBueUXq7dfxFhPdd7DGkCHbTw5Nq
         bcEKHuzsesrD4sH9aVU5qpCwD8IKSGO7fCRuVu4KtgBhA0Ht3JR8mhowZwZgB/DNSnkp
         So5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792487097; x=1793091897; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1EQskYS0D7RQlbdc42q06B8aUfDjbkE64g4Pl0A7js8=;
        b=KS1AFbh+RUlnRyYczf9BUEUIZP2JMbRVV77kkceNuVzuBNDF7PZsCn0FqeVeq4C7G0
         UMjgLX0PzOuiah80ZL7AQFlVaEBqlUZGCQ3MNGOE0g4kmL8Kppj6zmf/W41FCBqZxzbN
         uPl8HfSZvhjSXeBajx81DGSmebBgDPSsYAmG3kqa2f7QQLqHcdR8psbIjSUdojuo567y
         1gwpytO0Jo/sjRQ2yyKVRMdcLxuYyMWuttYovpbSGiVGMxjIp1E9a49P6fGRgYs7Q9iR
         Bpzgl/rJXkitTaOBMHqBso7HYX0Wnyr++rNZkupjnbsoKZ0VwsEwLJOPV4J54utgkXix
         IicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792487097; x=1793091897;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1EQskYS0D7RQlbdc42q06B8aUfDjbkE64g4Pl0A7js8=;
        b=AVH2l0413nbAELk4XD9qtbIYte5IxG5HtVWFHGZp+6M6TxKCIts/OVkr13eOt0LUqp
         CjzvH9c+QxWYMZKlDC49PRj71I3IaT+9ZDy8y/pMVbH9InXNYVSDpGmbNmOEUbiKM/9b
         2mGSsHjhmHPE++8j37T4KBep4Mj4DhSgio5STBHH9RM8gs2XDgKvfoLS03ymu72wdl7w
         1zdBhBx9lwh8WN4x/GElcGAvwia6JvZC7yC42GM8EIkCKKQbYfwuHpC7nrHF8BPWg9on
         AEmObK2LXqw67jWLXhyXC3kGnC95kA3HKUzdmrVYK3V2kMzVpp41/F57MnSgiO3WbA+n
         LN8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzivau9DRaWDHUunVYeFowbbiVmRWkGs85uOPZ05/OWdfjs1kjUtdQhLrBc6R3IJlC0I4+xF30iv9v4sVkUwA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9PBQlvKV5f9dnBPNnr31ir/XHFmE0HF1k/D3GQIIeM6VhNKMH
	hEA77IXAwkv8zatCIDw06CDVdzdGeqx6VQt9gI9XYVlutg5ldO5cHsUaHsIaiyMn2DBOCuqstNd
	Z4wcwPzMyqfczX7MHh16ZMkoyH/LiclM63qMHRuyn
X-Gm-Gg: AYBFou04kGXfBzelsOEYSRb7UcP2cwRzRLCYsygDItCPAqXpNlW75d7UX5ZQtUHzInZ
	k10NqIMUD/dcYBiG96b7F43qZflC/ilkaJjiqJK0WecC8B71od7i7+ATb+B+q8L2E4juLPxtirX
	CUZz5WeaxLlExzLgitqeEOpqzM+/dEkG4FAzIQ4+ZeqpWAojjZ4+6OqiOKF0k6n8kOVSeAQ60mN
	4HTrhDsf1bh/5a/AOgd3eGR/ilXM60EW+YogTv3uHMeHWW8p7REVCLg2Yxhxc1beB/PGm2QM7Ee
	FDA2m449In5OKrnVMju6paNTjFx0HM+lGuSCW/u1zelS76dFiZ72H+0WAlkOP4JjDU3sRyatksC
	L8YJOun76JHCXpWBijnLaklRPxi9NNvaOvzPi1uM5m5vEDH1MNpHiuedImY371cPAqEZppnJeD5
	VPr8/9qpEJQy7L
X-Received: by 2002:a05:6402:27d3:b0:6aa:ff76:3076 with SMTP id
 4fb4d7f45d1cf-6b3a8191bddmr6786581a12.32.1792487096676; Tue, 20 Oct 2026
 02:04:56 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-fwctl-cfi-encoding-v1-1-ebb30d1500df@google.com> <20261020115534.1134f2b3@inno-dell>
In-Reply-To: <20261020115534.1134f2b3@inno-dell>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 20 Oct 2026 11:04:43 +0200
X-Gm-Features: AclHuK8s5pDVPA952Sda847MnmKxiPykXZ_GhxHRu1vfO-Km8lE5fIjR6TFHhMM
Message-ID: <CAH5fLgj6oCjVheVLYu+X=ptFA-+x4cznX1+bgWT3ayndiA6eiw@mail.gmail.com>
Subject: Re: [PATCH] rust: fwctl: declare cfi_encoding for fwctl_rpc_scope
To: Zhi Wang <zhiw@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Dave Jiang <dave.jiang@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, Saeed Mahameed <saeedm@nvidia.com>, 
	Jonathan Cameron <jic23@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 10:56=E2=80=AFAM Zhi Wang <zhiw@nvidia.com> wrote:
>
> On Tue, 20 Oct 2026 08:28:37 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > Currently, VTable::fw_rpc_callback() takes scope as a u32, whereas C
> > calls fwctl_ops::fw_rpc with enum fwctl_rpc_scope. With kCFI enabled,
> > enum types are encoded distinctly from integers, causing every fw_rpc
> > indirect call into a Rust fwctl driver to trip a CFI failure. Thus,
> > generate fwctl_rpc_scope as a newtype with a cfi_encoding attribute
> > and use it in fw_rpc_callback().
> >
>
> Thanks for the fix. Looks good to me.
>
> Reviewed-by: Zhi Wang <zhiw@nvidia.com>
>
> BTW: I saw this =E2=80=9Clru_status=E2=80=9D needs the same treatment, gu=
ess bindgen
> will someday automatically handle this?

I believe lru_status is already handled.

Alice
