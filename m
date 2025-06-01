Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C761EFFB0
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Jun 2025 17:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748799183; cv=none; b=DRxZlwkXOdFZvyco+w3SfMwGXkLtnOC+633CYLJDs8fr2prE+mRn9U6qAwLZ3Y53ArLXfVsLuF/nBAIPOuGvM0cieARXHHfr5ZDwCz9a/EAEhSUzb2cBToBChGKg4I/3GdnEe+tUhDAcmU0jztAEMWNWEIbZQr7VV6xzzOpm7v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748799183; c=relaxed/simple;
	bh=Tf6XZkcBqvxDyqizynEKPAXVxWTJTm0KhepyjlqrXQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pi3x98SezxpEylV2Lg8yZ2kAYsWwGxmztaLXbrZZhVLsGiySJkuPRBwVldOQ+7HEfdG65vPir/2FcLggRsTwGbc0BrEemepfoK9zwf9hrqTTXjPUkxyMChuoJ+Lo4hlBdGdg49AJoqgmW8SHLstWRZGT37RAb8jlOuUWVijRDn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=2+a295+D; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="2+a295+D"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b2d46760950so3511573a12.3
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Jun 2025 10:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1748799180; x=1749403980; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KwxqXGlyR2Fx/nGgiKLqYKrCCGLZKVDH93SX+seqRzQ=;
        b=2+a295+DSIjAVvgCaNDx2Xu7HiTlY5SDhPGGNHmli0QYMz9NCzJFipbQ2y22gUirwh
         gX5FUAX+jqRDNepWW9FhsBXUsHXyUAu3BlVO0sJI0JmNVT6InBPx+nEPHiIhNz3p5hXn
         61TuhljiZn71B2NiaB4Dee+5MQ+pXJ6ik3UE5j1LOyQ9NiUIV6fO1+0R1Ubr1enbaCMi
         nXrTBmo3dcFOMfxv3T+LTlXBukSLoT2Dr5haSNuhjW06ti3JSzVgBpxcdpvfNZAS+1N7
         wvjnZlEM4PfOXgOq8bjL6PegjrlrgDjW8SyWCL1S92jWKiACQgpkXBvBcmrIncs6S5vU
         xJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748799180; x=1749403980;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KwxqXGlyR2Fx/nGgiKLqYKrCCGLZKVDH93SX+seqRzQ=;
        b=wbYvI8EQlYSzqGxyCU0uzN80oCOEobUnkYyMgJplqRnUmrqTvUipi+TTYe6ZzXb+Go
         Vc7uFwWZFsvH/hRUTRK2bd3KtFHZ9kjWW0NSPTTPGTU1N+Of0qLdbdALO47ITVwqFIbU
         cNwtGFSbn/xGs7pDKmzSxlMLFKu2xM79ukQZM+vYrwGRUWAuDmi8DMQ1xQHacJbkYrsL
         LyNGuuRlZEmssWFhfUK0Lsz0xaBIBBFEfbq1k1HFAs2n+Af8Rbc03pPbED4vrWlS5Zpn
         xcy2oUi+6SZ0sQ3EUY7w/p7KyLT+q4T00twH7gd6vpO3gwJaT6x5SH2ivfrC6JfXuB0p
         BOOw==
X-Forwarded-Encrypted: i=1; AJvYcCXUN/G/g2TW5DleDJw/C+CfZpsDbl8cybKAtSMiyi6MV4moRlFPBuPcRIv1V9/zqRDSfDNSXOCjllwOb7GRFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqAt2lHLcW2bd5xnS8HC02n+GHTRiEHT66eQccWQKh3gG/Y1N5
	tHuC75KIoo1VLOigZdR/oK7yfEQtOLgE428GwJxtovJH8NvdzmXeJQ7FRLNSEEJEYtg=
X-Gm-Gg: ASbGncsqvrPWejrdHYZ4byIlKbthO0J8HPFI4ALbNt9JBDtiUys+4EiwFmQmDiKnFA7
	8wGNwTTAlhJnRLVBKyLcLGXRtA005b9NKMSA/N9h0PQjcaNL1D1Tocp7s11zdphzo5U2CcnpT6P
	xb4e8XTBhkQdGjD+AY4wiLbIiOWXUmeVN8yUCxmGISYwWlcFuR7G1oc3PKZ/oqTgy8qFE7zDq/8
	fhLaC4mYjYBcfm3i6ajjeLWrKv137LLUWgw5slGeWcxCu70B+rDpX64lHF2UylOyzrBZt9kpnet
	lXoex0N7uVvFxf5pCNRkYJYNTWnMxswo6kDDlNkkz/0=
X-Google-Smtp-Source: AGHT+IHrFx7wYIOsRR7w+nhhaUaBjBPFlogADiEeijaQ54Eff3trva8IRdJ651TwtDaee4aD84OUNA==
X-Received: by 2002:a17:902:c952:b0:235:2799:634 with SMTP id d9443c01a7336-2355f763a5amr61139085ad.8.1748799180449;
        Sun, 01 Jun 2025 10:33:00 -0700 (PDT)
Received: from x1 ([97.120.245.255])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd372esm57224935ad.128.2025.06.01.10.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 10:33:00 -0700 (PDT)
Date: Sun, 1 Jun 2025 10:32:58 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 5/6] riscv: dts: thead: Add PVT node
Message-ID: <aDyOyg6eqDEFg2ua@x1>
References: <20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com>
 <CGME20250524211525eucas1p244963b69e0531c95a9052e4a7a1d1e01@eucas1p2.samsung.com>
 <20250524-rust-next-pwm-working-fan-for-sending-v1-5-bdd2d5094ff7@samsung.com>
 <aDVxDJi0KkWXiPCK@x1>
 <61eecafb-8ad1-4306-88cb-a032eefb2e48@samsung.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <61eecafb-8ad1-4306-88cb-a032eefb2e48@samsung.com>

On Sun, Jun 01, 2025 at 09:50:52AM +0200, Michal Wilczynski wrote:
> 
> 
> On 5/27/25 10:00, Drew Fustini wrote:
> > On Sat, May 24, 2025 at 11:14:59PM +0200, Michal Wilczynski wrote:
> >> Add PVT DT node for thermal sensor.
> >>
> >> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> >> ---
> >>  arch/riscv/boot/dts/thead/th1520.dtsi | 11 +++++++++++
> >>  1 file changed, 11 insertions(+)
> >>
> >> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> >> index f24e12d7259fabcfbdc2dfa966d759db06684ab4..faf5c3aaf209b24cd99ddc377a88e08a8cce24fe 100644
> >> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> >> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> >> @@ -648,6 +648,17 @@ padctrl_aosys: pinctrl@fffff4a000 {
> >>  			thead,pad-group = <1>;
> >>  		};
> >>  
> >> +		pvt: pvt@fffff4e000 {
> >> +			compatible = "moortec,mr75203";
> >> +			reg = <0xff 0xfff4e000 0x0 0x80>,
> >> +			      <0xff 0xfff4e080 0x0 0x100>,
> >> +			      <0xff 0xfff4e180 0x0 0x680>,
> >> +			      <0xff 0xfff4e800 0x0 0x600>;
> >> +			reg-names = "common", "ts", "pd", "vm";
> >> +			clocks = <&aonsys_clk>;
> >> +			#thermal-sensor-cells = <1>;
> >> +		};
> >> +
> >>  		gpio@fffff52000 {
> >>  			compatible = "snps,dw-apb-gpio";
> >>  			reg = <0xff 0xfff52000 0x0 0x1000>;
> >>
> >> -- 
> >> 2.34.1
> >>
> > 
> > I found that on my lpi4a that boot while hang after applying this patch.
> > I think that it is related to clocks as boot finished okay when using
> > clk_ignore_unused on the kernel cmdline. Do you happen have that in your
> > kernel cmdline?
> > 
> > I need to investigate further to understand which clocks are causing the
> > problem.
> > 
> > Thanks,
> > Drew
> > 
> 
> Thanks for your earlier message. I've investigated, and you were right
> about the clocks – the specific one causing the hang is CLK_CPU2AON_X2H.

Thanks for tracking down the clk causing the hang. I can confirm that
this fixes the boot hang:

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index ebfb1d59401d..4d0179b8c17c 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -792,7 +792,7 @@ static CCU_GATE(CLK_AON2CPU_A2X, aon2cpu_a2x_clk, "aon2cpu-a2x", axi4_cpusys2_ac
                0x134, BIT(8), 0);
 static CCU_GATE(CLK_X2X_CPUSYS, x2x_cpusys_clk, "x2x-cpusys", axi4_cpusys2_aclk_pd,
                0x134, BIT(7), 0);
-static CCU_GATE(CLK_CPU2AON_X2H, cpu2aon_x2h_clk, "cpu2aon-x2h", axi_aclk_pd, 0x138, BIT(8), 0);
+static CCU_GATE(CLK_CPU2AON_X2H, cpu2aon_x2h_clk, "cpu2aon-x2h", axi_aclk_pd, 0x138, BIT(8), CLK_IGNORE_UNUSED);
 static CCU_GATE(CLK_CPU2PERI_X2H, cpu2peri_x2h_clk, "cpu2peri-x2h", axi4_cpusys2_aclk_pd,
                0x140, BIT(9), CLK_IGNORE_UNUSED);
 static CCU_GATE(CLK_PERISYS_APB1_HCLK, perisys_apb1_hclk, "perisys-apb1-hclk", perisys_ahb_hclk_pd,

> 
> This appears to be an AHB bus clock required for CPU access to the AON
> domain. My proposed solution is to make the pvt node a child of a new
> parent bus node in the Device Tree. This new "AON bus" node would then
> explicitly request and manage CLK_CPU2AON_X2H, ensuring it's enabled
> when its children are accessed.
> 
> What are your thoughts on this approach?

I think that is a good approach. The alternative would be to just add
CLK_IGNORE_UNUSED like above. I've done it before but it is a bit of a
hack.

Thanks,
Drew
