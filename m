Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338994;
	b=MHmmpvC5XMXxioIlOGlVch1QBWr9LyWXf2dD7ZTOI58Uaj3jLV1P6UUtmVfuJxLQ9yNs
	 ngON4i4zeQmW3Q2TlpoygivyLWMm0z5PPhJA8/Fq7jk1kZ39fIzPjySeZMOzxJkt/u12Y
	 Zwej4DKBD0vLlq+HwL9Mkt2+cPURe43jwcCdA+K0uFuxxPo+26Q7A53HW1/MOJPBD/NGk
	 efG5fGYONP8yZ41sFuCgW0mBf2LS15mliTdcRsLhOnOiXqx1z3n1gU3A35zmkCLRy8uff
	 0K2b/nNHiinZX8M3brFzwUWdRd5YR1K8FBeylq+AQzHpDnVRUN+RAy7EY0dyhfG8olg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=bCWYMiBYjhAym3CK4+93yurIeQTmlbS6kD3ZxpQIRR4=;
	b=0vGFobBnyAuqtw4yyq1+mBSuTx3eRPnQJlb8Oi5UODxLQwvSCDfkRsRtsxW1PDIkdyLS
	 abrSy2YAd0i0pUt/NxmQ1+3PJjoKhQZfyYMiaGfcx+tY9w61Xj23GpW1WGtoI/Vl4KA5W
	 9Azgd8oFq34IuG6/iH2cimDU4itgAN8bbFIM6CpEu0lzt3eKauzDKjYVE4rN7zap2UgLu
	 10aHSMvUU52YeBRdlSdj7z6BCqmhqGeSOwtP7jxfHBXcIYQRLI+YEVL/OV1eXjncsRs8I
	 6echd1XpgK/pyLDeloUnBJaG+fQ4QGDTMDdQvH1sP8YKxRks/m2GbXK+7pDxvjprYng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="AQTXK/7n";
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A229606A31C
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 05:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A229606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AQTXK/7n
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-3ae1dca6bc0so150635a91.1
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 22:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793338993; x=1793943793; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bCWYMiBYjhAym3CK4+93yurIeQTmlbS6kD3ZxpQIRR4=;
        b=AQTXK/7nV7AtiXcnztdcwiTjjJrOqKxtXmR0kgdEh3k7rNpZox8Rr6/D12TY2CulD0
         1WfqOLcvFVmzKbTwxhQnWcyxSBQGbB1XTlv34xNCGfAgrNMW1dUmw58H7RBELO7BIR+l
         LUUl7odHPoXUMXr0CKwN9+WERWYMTHJhKLsM2TZL6f4y+E/9O2JmpqLhtAzgLPHgTIAT
         wbNHZGVIAyrBxenfjBNIcydy52ZAFAIcLXf/VDwRJWHt8UM/amk0XQi5rhjkFXHTZKav
         LfaZyRgtqNVumd0bSWt3fnHlCWEJ85bKglDw9Z1GOPHSPToWPvShBIRShlQmkgMw3KE1
         hTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793338993; x=1793943793;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bCWYMiBYjhAym3CK4+93yurIeQTmlbS6kD3ZxpQIRR4=;
        b=RO++DoPMH4TKrVeQ3HlcVZQ6rEVeJ/nSDMnntgdV62js45c8jrZSTnIWOhoQbCKN9f
         87ktJjsbbIsORD+khH+hptGSX2hd4uZ0OzmmzC1HOX94kP5iI3P4ykpXS8KeZsuUhJgX
         pmT/oleTzjfG+ocC3vJ1W/lRXVYNN2UnSzCJBAQedb605x0vNhmsje9MIvalaOS2sJd/
         UGqaGx+fFBhlp8lMHeQ62Zs6HoOHdQnMJUXru/bm4lhTlfbfq0j6KoLXP2TW39vUebYJ
         KNkmdBhCQABKABvrWrKdFK6tn5jcbEX07NCqLrEcwRvYza8iVEVtTQbTfhwmLuokkZsO
         2VZg==
X-Forwarded-Encrypted: i=1; AKwUvByhsCzKjm2k6Ev1n8xv3c4LB0alEKioixBtidJclHn80HAGK4HoOGmQuzf7VUZuyhIjbJXUpzhHjb9grmvEKA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI63PwTbq/g1iXCny51aZU+erosQkDp4EAXfjre8Zd/9xR40WKZ
	b/898/Q7r7ySNgo7+M8Gn8v/F2aqzv69ZPHzKBHFUXX3yxhC69a7F9Ly
X-Gm-Gg: AYBFou3hvzowSjYUtj6SVC702EGahBuM8GKZhX4XSApd7N1jC0xfhksT830+l2BsLVT
	ZDQyYlUCYftoUVIoR7lNEii9ovqX6m/owHvEv+EeT8XDQ/odz/FifVtzpv3EIwaRIS9wyoEO1IC
	3PqfW64bPZG9mmFJFlCfTsoahejRyRRyTqQ7Mb92lcJswd+61/uch51w1OMZ3LMcZs67AAx6IZ+
	AXVBa1xmrBI9U8qG4uGQK6+pD50EBGjpK6a4Dq6kBS1YvNNJ0LeuEmOS+Tpu+Kw7VFHvjvqTZJT
	XAYie+nxcW+buVrbuoAL5W7tSaY6qaLRUmIbHh8lQpG1qX6biEFIEfonQYvsZruwNC26WaQkijb
	qBw+CwqSJIO4LPoKsBl8vzboJw7jrxji1IcKhJwCTKz6LDTKD06/ETMcZ/hyjCEcD9R+vFF6gIY
	qeQJBNnYQPxi0U8e6SpOWgqeVjg7Zukr89rnlqGXk5IuYWXBjGfmYqli7mZo8iShUnuSxW3LA4+
	KMsiGmbIW+oHX229LCC2o9YA7YO4Tns4cVVK6C9ffyWfDpeZHXJ3VY5WhQip7jtQ4cW3tmsIVRR
	60UhWYBw4NwPqXfANwtVgw==
X-Received: by 2002:a17:90b:17c5:b0:3ab:413:49b1 with SMTP id 98e67ed59e1d1-3ae897c0a0dmr1047677a91.48.1793338992989;
        Thu, 29 Oct 2026 22:43:12 -0700 (PDT)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a703esm7084621a91.0.2026.10.29.22.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 22:43:12 -0700 (PDT)
Date: Fri, 30 Oct 2026 01:42:56 -0400
From: Kwanghoon Son <asdfkwang@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 01/12] dt-bindings: vendor-prefixes: Add Bouffalo Lab
Message-ID: <auQuYJqQNv4LMDP8@debian>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-1-b736ee920078@gmail.com>
 <20261029-unpaired-viper-830e55436015@spud>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-unpaired-viper-830e55436015@spud>

On Thu, Oct 29, 2026 at 06:52:15PM +0000, Conor Dooley wrote:
> On Thu, Oct 29, 2026 at 01:05:42AM -0400, Kwanghoon Son wrote:
> > Register bflb for Bouffalo Lab Technology (Nanjing) Co., Ltd. Reuse the
> > prefix already deployed by Zephyr, including its bflb,uart binding.
> > 
> > Link: https://docs.zephyrproject.org/latest/build/dts/api/bindings/serial/bflb,uart.html
> > 
> > Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
> 
> Worth noting that last time this came up, we agreed on "bouffalolab"
> because that matched the domain used by the vendor - which is what we
> use as the source for compatible strings.
> 

Right. I'll use "bouffalolab".
I'll also remove the justification based on Zephyr's naming from the
commit message and cover letter. (I thought it matters..)

> https://lore.kernel.org/all/20230607195027.GA3894404-robh@kernel.org/
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > index 5471a06f93f1012f08e26f7f105ad846ab3629ac..24c670ff75b6f482ede1bda3b59c70ed9116042f 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -249,6 +249,8 @@ patternProperties:
> >      description: Shanghai Belling Co., Ltd.
> >    "^bestar,.*":
> >      description: Shenzhen Bestar Electronic Technology Co., Ltd.
> > +  "^bflb,.*":
> > +    description: Bouffalo Lab Technology (Nanjing) Co., Ltd.
> >    "^bhf,.*":
> >      description: Beckhoff Automation GmbH & Co. KG
> >    "^bigtreetech,.*":
> > 
> > -- 
> > 2.47.3
> > 


