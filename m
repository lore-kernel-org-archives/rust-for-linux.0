Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794104879;
	b=q/JV8VJ8oRqVsI313sdhEumov54Gtg33ltXa59Q+FkAg6jGOkoMJ7+h8LVuNTNZXT2Mr
	 hRGZH7zFVZDN55q3rGDdKfWXL/DEDmnD2/C7Dh8Ow9pvpiNnJWBeC44KVJnnmuzjFzd8A
	 gaUqFZ1zh2/g7fNtVCtqHAqedVDIuNCOtMLVtbKybkwaJ1KoJlbi8KCdoiv8HlSuZNKm9
	 vMiNvbA4CsSFH1gDK7JiDxOsoLyx7FXuk8amc/Ic6rQWnd7U6k7/JRKoQjmXJS6VfeOJL
	 y3cYOeToYin61bMVdAuz5lBJJmUGg8iuvHHER/WqpxRbdBiNBahThtj39KaI3kYbq2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794104879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CgFyMsoiKO2B1HX2AvfFumGFOpktUiaDt0kSWOji51M=;
	b=y76qe501JmAhGNYLBrZgvXuHQ8PWq7ijt1kjFxSepAobFAaY5jGw4A+/rrlXgJ8Sh0EL
	 ycELbpprZa4IY/stGN62TmbsmCJPTPpcSyUnETNcxfHjlbWTJ7/4TOpINjrgzqgygR8QT
	 NRhKHT6YGiZ/U9SLsECEP25skYS02KqbCIArOQuMuzyvkQ+iRxDPPDEUBIlroyq9L4CNM
	 SvEhgdQpJ8yAxZXI6gm5CU+0+P961l4FjDwYCsNpnVuosbfYDlNstf8WkGDO/LxUClhje
	 gmGYvp3fiInvEWYQuEey4IkawtIKrGemTn/57Oz0ONQ0dadygzl1uB78xx2PBfoFu7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Crtt9KFl;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB85C606A31D
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Nov 2026 02:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB85C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Crtt9KFl
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso665744eec.0
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Nov 2026 18:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794104878; x=1794709678; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CgFyMsoiKO2B1HX2AvfFumGFOpktUiaDt0kSWOji51M=;
        b=Crtt9KFlMLRjcguZk1VYPvhTgDNZMElzf0tf141OxRDD0nRpz/y1O2me5bx5zPEHRw
         DOcFer5e04/3lH3hXFl06ApuJDKLG77CFSixsb0t6MlRt5PwYzLnVHXQt/lmhfJSUCov
         8/IoZwOneMKYGudlQKvHL0tGwwIWFHD5bmHdaSx2Aca7D6KfUw3p0kAAsMbidPHSH9K6
         Vtd7DUJBiDizA1z7P9/HbJj4YxUHaR6Y20nKVwijj6Y8lmutdnjW1IMT8sE8avgxaW3d
         2oCXfkkFNdLeVsQOzUyKG8TFQRCGvgtR9ixvehQM1zvDECpHHm1ePN1spXa/oKXtzuE9
         +A7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794104878; x=1794709678;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgFyMsoiKO2B1HX2AvfFumGFOpktUiaDt0kSWOji51M=;
        b=N4jDkVEnlKtqAH3DtCN+73kmCfSB5xKk8OHk+SVVEpNmz//N3SLJ9RwICtjAndM/PR
         0te9eKCi8RtmyJQl95bxJs4XPaEfCQjEeIkMKqZNu50GAeE8962Qf5+UVElorZtiddWq
         OvRgT9Q4Ul91ncMcBAgpNGueUhumG8yCkE5wR97pa+iwpqTulUPei/SEBNBXdz+aAamW
         j4pvV3iKXJkAarWlUSirHMBOgX/2hPiaZgcpw6mVpNl3QsFKHSBVWmaHw+zY5HrSgkOY
         dfDtKWEQ/zJE2stSDN6WIoM6CCb5Xj/3I2Xf24OInsgx1aGDwilG/CAAx63spL/ZS8mE
         99Ug==
X-Forwarded-Encrypted: i=1; AKwUvBw7oMieDNdqyp309K6KWC0V1+tZpwjWkBsPqOBl55cYuwgYfdddLvMLXA8sU/PDKGTOWPQJttwTimlU69a5qA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/FEd7cT4A11Ug5ZK3mL9YArnCu1n9J6wTcxCDgFq7RVJbd/ZyU
	CLXgO6cEJblFS+a2Vf2YCV+qlCzrvJGinbwPeI46AQZke/1hsUrumdAs
X-Gm-Gg: AYBFou2pLmlLVZozVdtMNJNFCmFd+D6+hwoYJ1YKwfn9SkP/L0TmuSzgBy8upXeeeTq
	POrZ7/8ujNhhGrwoaPSmuEQ2ftSEgLNjla1v36UjctKFnoPHNeEldSRSfOuDwGk3cOuHO4bs3rc
	XL7ZfVtcS9KTNOBkcTSL4KWOdGtvzgW5anO/Y6YMSPWqKTE1itOyOrdzf7kgBhpLdwCyU3ORjEL
	WoT/XXUV8TCt9Dw6Q2wGB+R9iwuwgmgwS596h/CHSFuTYOJk65pinsfo0357PK66EDMVqJGTOmq
	I6+vxrwtgQx1uBJ8DCpSKBO0WMkkS6AH+ag8N7+RBAsYSWiOmyBqLID0NbH8kW7wcKVRO/d6jDp
	JcDUJXFpfjmbNkQDsQLEq3mvtbLb6VqPJ4+lmWmeQ67Jf7Z2iyXsy4azgNo/r5sO5WJqssHrCdZ
	MOMj34Ote+wq9Kixtb6ZaA2T68nwwHzLoBAoY57ngxk++tLgyPPX8CHdTjkC40nM5fWequxXUSU
	G/S/KfvAwQ4oW5YACporajg2zDl9CoxGnAdFpB2hbpRfS+hgvtFQ6xhBpOpSKDYE4KScQxX+SDU
	/u9qvUFw265iVlk7R+dL
X-Received: by 2002:a05:7022:b0c6:b0:190:d0d9:3110 with SMTP id a92af1059eb24-1b39ff2dademr463410c88.45.1794104877934;
        Sat, 07 Nov 2026 18:27:57 -0800 (PST)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771ea85bsm2390172c88.18.2026.11.07.18.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 18:27:57 -0800 (PST)
Date: Sat, 7 Nov 2026 21:27:32 -0500
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
Subject: Re: [PATCH RFC 12/12] MAINTAINERS: Add Bouffalo Lab BL808 support
Message-ID: <au_eFNCt54nlCafy@debian>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-12-b736ee920078@gmail.com>
 <20261029-spyglass-evasion-772697094cb9@spud>
 <20261029-amuser-savior-6a6ab062f471@spud>
 <auSDJH9V31wmbrYv@debian>
 <20261030-slider-finished-360b10521e0b@spud>
 <auXQaY25XfYzxEb1@debian>
 <20261102-throng-botanical-b244058ecc37@spud>
 <auqC9jOIQTyieQUJ@debian>
 <20261106-dislike-despise-91106ac848dd@spud>
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
In-Reply-To: <20261106-dislike-despise-91106ac848dd@spud>

On Fri, Nov 06, 2026 at 06:00:13PM +0000, Conor Dooley wrote:
> 
> Cool. One thing that I noticed, and felt it was a bit odd actually is
> that the uarts are fed directly from the crystal oscillator. Jisheng had
> that in his original series though so I assume that's actually how the
> hardware works?

I carried over the direct crystal reference from Jisheng's series.
But will change in v2.

UART3's baud clock passes through a mux and divider. The current M1s
firmware selects the 40 MHz crystal via MM_XCLK, while the APB register
interface runs at 160 MHz.

Following your feedback, the UART node in my v2 work now describes
complete form of clock itself.
two clock inputs:

clocks = <&uart_apb>, <&uart_baud>;
clock-names = "apb", "baud";

uart_apb: clock-uart-apb {
    compatible = "fixed-clock";
    #clock-cells = <0>;
    clock-frequency = <160000000>;
};

The fixed-clock providers currently reflect the firmware settings.
I'll add proper clock-controller support before submitting the DTS.

Best regards,
kwang.
