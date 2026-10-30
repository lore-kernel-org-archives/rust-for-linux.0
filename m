Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793339786;
	b=4OJYG2u49CfoN6fxyis8NDiQZWISAfd8E9rEi6jh+pe2IeU+t/gsDzjU9/zhQ6zz++Tb
	 f8mWcPG+JouU2XAdZ0vHXUVqXp7PaZtexCecLufCr/F1WWuTldZznXsOYBouGX1dTi39p
	 jO0wdsqdEBXx/FCrkAjWhkQ/8UzJMNNYEsAwMdrOhjpTC0sJtxADV7FwZATG2DlGz+WFF
	 r62v+/xv0sleBFsQ9TFtQ1ykO22cZ6NpfsGLvDZ+oE7YcLnoFKAb64Cz26DzD76kg+FAc
	 QHXelBfFR7RZ0ug1YrTFRYmuTL+rsDY+RUu/opG+XO3tF28Y+VGHgx6Bt/cPKHFrNqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793339786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1anniFrPD+gJ2zvk7tqiNGRs4XaU4IBzFvazZsvzhO0=;
	b=CO5+CRfNyVvFCCzjymzyQySdTmE5Pbx4GilRtcwQwXgcIgus8WBCXKcM//UIoRbGQWo/
	 LVXkNwqynVXOrCtlkbzi0Zk8pHETcGtdUCNcZeq+KDeUovAWvdh9z1t3QDq8sCyEPN0B8
	 acuFW7JKW6DEF2w8kGP3R3KhVbEOWKvr7hKD17MZ3FlYKHW9WAfLzUA8ttaZPrbZdLdj+
	 AsFWSTgBiXb4XFoE+YOm/+lLHPLp9UrwDjyCD5OO0jVqZGeYMZq3WT5HKbFF6wzAocGnn
	 ZsszH3nlHh2hFXZK2TxiNnUW438qQJrmVGNO5/mvjcY0iouv/SHjO8uw0w+I8tYowYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fKl8poaN;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25042606A31E
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 05:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25042606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fKl8poaN
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ac6fe4aff0so304490a91.0
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 22:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793339785; x=1793944585; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1anniFrPD+gJ2zvk7tqiNGRs4XaU4IBzFvazZsvzhO0=;
        b=fKl8poaNCXBEsyf/0TeOYoZMv/2E/sAsxAaTA9idn5zsncnfapu7bD/PQdeQW90Mzn
         mCzONwoZQBnHk4TvJHXmIuspzXUn2H9t0CUzKLY1wjQUoPQ/WFGjC1kyGeWOVUfAH7gn
         GGYPK34LxFAT6RfKoRFzuiMs300X7QNHK52ld/T6rNpRC10GIZTZAaR38cwWwa+pmqT5
         xNgxif723swRBNrxKbd869GrkaKNVdZpoP+PWOZhlwDvb9cJbQyMqi3Wk+fWZiTUYEyX
         DcD6QyYsXGvI0CVsu9lwhMgY6tQGm8IllX03u0UwLGi6Az2Gg87e7aQzoHzlusCMUJEt
         DEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793339785; x=1793944585;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1anniFrPD+gJ2zvk7tqiNGRs4XaU4IBzFvazZsvzhO0=;
        b=adZlOClalIE4HZQke25iIhAYSCpdftcGwsCKRE9yIIJ4FycVf7uBUmw3FYB8H1jB7f
         oiIeGn4bCvUb8bow9ZGOtFstTwlUvHoEmUS/UCH6K+Xy1csWcAA73Ti1sjxBPlOctEE6
         Pq4q1Nj9VCFhH14EZvTshyx9nXZzUo73wwIURgy4ynpWMFktNVTnkjLuk9I7B0dq++fa
         f1Han8fdXUlR7oFIw1xj8k3LGkRSp9tAJRb+duOqHajoByHz+YPOsQRtn9Kd2ZYT3hka
         /ATvDpAyJsXhkuajlya9X4V9EQjaJL47bC1QFWnBmL2+w9n0I5dafLCtEWJFwca5cHjO
         DQ7A==
X-Forwarded-Encrypted: i=1; AKwUvBzKKad4X8rs2bgcsbgLJDxNmwHSe+AdSpniWIsje2g6vwos9DBW9OUnHpM3wWuOEA9kxQRULBuAgXfmLpvtnA==@vger.kernel.org
X-Gm-Message-State: AFq9FYL9QCHGMsHLWbzgKP6/pA4pWh/A39s96xgWhoQ4EU3+1pF+mjEC
	rrr4ElbRdkLgUdZO4cGnuG5P9tylqwb63bk1lSm0JzYglTS0kcEXHpDP
X-Gm-Gg: AYBFou2y957b53vZI4sShO6S7Q0m2xNHETLuhqP6ifap7U12JOnUAMvMu7fCyFFVIeo
	+Sv0qeKVIdo+U4dzc2KDCSeSZMOnDzfkmkKIbAN+bidAG1F3DHcCBnBTT5BhtOJmRz8iwLJ8uLT
	YTVYMB9FWMPKAsNl4zPQRX2kKxXgJMhKTRVH94jfNye+i3V4DStJDSN64OXNDCn4gvXELKA8pc7
	GJ7qqkRCal882e17itZ/y738zC6RVIGtg3AKAtRmygjT/3nTfBI9aDrGfmadqxU1cn8opWl0jbu
	+AQHPhvLwqdvLjDhUqiCGkUjJYWPXVvh6mdJ0loXOp93UjudAuMZWYfO0ytBZIS9DwcUGpt7MN4
	glmpH/cGLeyueCVvBjRlVyzlzeKa9E1GwjM8Podu0Vx+L1kuIHqvfyuJPem7rDq6XiKxVScSjZS
	nTqUfiw7XLFnpClbZBAhMNIWCjHEw0cniYZsqWlYOOp55d497bZfCK5GTANV+vXROg4u3CLf4BF
	XbYwVIQnecCCqdEff0mmymBf/UfiCO5GiuM9+9aAKWNnwUCnNlayDsSqnyW6LepgR59ReKIIM5N
	tTOZOmfDu1H/UjQlzQKyEA==
X-Received: by 2002:a17:90b:3142:b0:3ab:4f1:4f7e with SMTP id 98e67ed59e1d1-3ae897f3919mr1033345a91.28.1793339785483;
        Thu, 29 Oct 2026 22:56:25 -0700 (PDT)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8454327esm2520564a91.4.2026.10.29.22.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 22:56:24 -0700 (PDT)
Date: Fri, 30 Oct 2026 01:56:15 -0400
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
Subject: Re: [PATCH RFC 05/12] dt-bindings: serial: Add BL808 UART
Message-ID: <auQxfw7NgnfnVi2G@debian>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-5-b736ee920078@gmail.com>
 <20261029-pouch-enunciate-e74cf84e42a7@spud>
 <20261029-sequester-countable-6a7b597c2551@spud>
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
In-Reply-To: <20261029-sequester-countable-6a7b597c2551@spud>

On Thu, Oct 29, 2026 at 07:18:38PM +0000, Conor Dooley wrote:
> On Thu, Oct 29, 2026 at 06:54:49PM +0000, Conor Dooley wrote:
> > On Thu, Oct 29, 2026 at 01:05:46AM -0400, Kwanghoon Son wrote:
> > > Describe the UART register range, interrupt and baud clock input.
> > > Initial Linux support targets the BL808 32-byte FIFO and reuses
> > > Zephyr's bflb,uart compatible. UART3 is D0 PLIC source 20.
> > > 
> > > Link: https://docs.zephyrproject.org/latest/build/dts/api/bindings/serial/bflb,uart.html
> > > 
> > > Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
> > > ---
> > >  .../devicetree/bindings/serial/bflb,uart.yaml      | 57 ++++++++++++++++++++++
> > >  1 file changed, 57 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/serial/bflb,uart.yaml b/Documentation/devicetree/bindings/serial/bflb,uart.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..df29d258f0a1c6d7bb283cf19c4157436991b64b
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/serial/bflb,uart.yaml
> > > @@ -0,0 +1,57 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/serial/bflb,uart.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Bouffalo Lab UART Controller
> > > +
> > > +description: |
> > > +  UART IP used by Bouffalo Lab SoCs. Initial Linux support covers the
> > > +  BL808 controller with a 32-byte FIFO. The compatible follows Zephyr.
> > > +
> > > +maintainers:
> > > +  - Kwanghoon Son <asdfkwang@gmail.com>
> > > +
> > > +allOf:
> > > +  - $ref: serial.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: bflb,uart
> > 
> > This needs to be a device-specific compatible - please just use the
> > binding already reviewed and agreed upon in Jisheng's 2023 series.

Again. I'll base this on Jisheng's reviewed binding which is
"bouffalolab,bl808-uart".

> > 
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: Baud rate generator clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: baud
> > 
> > Drop this clock name, with only one clock there's no more need for it
> > than the interrupt-names or reg-names that you do not use either.

I'll remove clock-names from the binding, driver will look up the single
clock without a name.

> 
> And additionally, I see no value in picking something to suit zephyr,
> when zephyr uses things like "bflb,clock-controller" or "bflb,pwm-1" and
> "bflb,pwm2" and so on. Make a clean break and do things correctly rather
> than try (and fail) to be compatible with the zephyr dts.
> 

I'll describe the hardware rather than compatiblity reusing the Zephyr
name.

> > 
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts
> > > +  - clocks
> > > +  - clock-names
> > > +
> > > +unevaluatedProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > +
> > > +    uart3: serial@30002000 {
> > > +        compatible = "bflb,uart";
> > > +        reg = <0x30002000 0x1000>;
> > > +        interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
> > > +        clocks = <&uart_baud>;
> > > +        clock-names = "baud";
> > > +    };
> > > +...
> > > 
> > > -- 
> > > 2.47.3
> > > 
> 
> 


