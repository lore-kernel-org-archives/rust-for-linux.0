Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47E33F4118
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Oct 2026 18:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791140210; cv=none; b=P9Yh6SZcrByTr349zA0yNpTVT5dgfzTgYJtAYzMtGfF/jhhsV1v/jkbSLgtYVIvGu94uFSdNFXZMvbUGOt2l0SULmk49+1MNa+QrC6Qex934sF+/nNkYOPk6+JRfLTWgvTY3h5vcPGLiAyBL3qNM+Hr0ICFwSRV8Dtzjrex6uys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791140210; c=relaxed/simple;
	bh=VTj3CjFmC5z/dk0JCaA0IK0lT5Ac/9t7urJwAwDbeYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRJPBQzV+9SdSclSgHXM1lkRd4c2URnRXrgRuDDQHIJm5IE8+hAEHQV0awsVxszUOfNhrHavxFOb8ggAojPo+ivfSdsIIVrEIMBf3l6m83l8l1BGsaW/cSXX+qIOticJhZmJkjUmENwahplqqG2WFjmuAPkzqJ4exm3MgCONPBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rs53PO8a; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rs53PO8a"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-488811c9ebaso473169f8f.2
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Oct 2026 11:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791140207; x=1791745007; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yLp7Ndo/7k4Ng8+ohcODGZItHn+YB7X4XQ/xgVicdsE=;
        b=Rs53PO8aGtje+RESDecn/lmAHXtNqojJu8nzqQalVgLSX4H00TW/wvMbJCecyvLB4v
         q9t8bY2emZpOPGa1h7F+9ij25uVvPaO3yl5lE2kSPQ6XLJUCzBpoZ1llZgfln5jLmRTK
         VNypW6hrgWjmRPL3CYiDoSCwuSLqFu3Y/pjQRN58QSEBC886UYEs6uxuWvj9idcGtiAo
         NS6wC10/8ngy8GvKFJwYkrXp245ZG6t1C3d79nqfTsbnsgyGNpDAH5TNdgVYZHwpp/LF
         ZWSQAl3biIQ0zVkTFFJDdvM3TZuSeaC3PDpO8J5dvLeIF5K3eSFauR4Cdrr2I/r70KUd
         BdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791140207; x=1791745007;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yLp7Ndo/7k4Ng8+ohcODGZItHn+YB7X4XQ/xgVicdsE=;
        b=XaiP/ArKyusTlYrqpSddRBEc2BG/vSdHEk1cri9o0TMgH9sjStTgs26048y58dVONQ
         yvrf2DAclKli6XS6opbXSmRz4ftmbKRn/vlkW5x735rQsf6oaXwnB3it5WipuDG4J61Z
         J7nXwq+kD3+2Gc3FNKpD/7z/McmwqqOCc2Ux5iL/+fT17BwIDSrBwKwpeZFt3E9RYMR3
         YDshZj4srT+Yo/dybBcBLxwn90Y/B+h1NsG4h4dkFTurNvQ9yRMZ8uAtD13JAKtLy4pP
         q9Dv+j1a1pCo3AberV+1zCljNc/JSzVedOS8ADIAvVE11bDaZT29ImVeNUZaUlYVqQmL
         8+TA==
X-Forwarded-Encrypted: i=1; AKwUvBy/1wq/5APmzf2gisAvn4RkOXmwkTuUde0nVS/pQVlTBpUTd/PVVWEikOz03FILFOWtRT9iEXbktGHdFb7c9A==@vger.kernel.org
X-Gm-Message-State: AFuF++nRPIv/WvcNsPXuaUhxxREQgvRRurGROTrVI++4npjUhXqNUU0T
	svrsjfRx7pxSyTJG1qAJmO/Xh/LaJ13AM/3sY2+gFSsyiEFvjLZ2GEc2
X-Gm-Gg: AYBFou1FotTybaC3xl8q47Hp9vfXHDgsxxrdRd7vavrYd4AXQow2cpURhaBl4idumsi
	Oe/rc01EUoCv3MiPl+WujWfjlo9czd/xHyDcGbl2O4ARqhSocf5NIMYlFaSLw6lU6nEGAOEQoFX
	nvwXZk/DyAB3InAG4AZVf53flUn6VJdfXQ9fjHwwEqTVdBu6tihEjaXshSCPtEwS55PiVAZegKe
	Tez16iqUjEbgPKZe/IYxLDFcK7aYF9AVGj+Rq/sVfkLuNlBUfuk2rd9i2NIYranpBU6oNmzlAYh
	cDjKeQLvbH9cKzgdc/oFL3u2tixq3k7/5rJqcUgBDP2EJhf4upuDr24oDF/i39tJX7Lt/mLu68Z
	H2jddUDl2hnXoUtGtDILY3sPSAWxETjM4D7UK275VGfCOZGOwa29CVxgLbmXEr88fp9pSDK3Rdq
	2CtTObBq5YBIYSfX7d7qNvjeXAveSafEcu3eZBb4HWx1NX4pOy8g/kYQ8X96KbvRwegCh5+Ygn5
	wKoV0zsyViKVLJZWnZRPcQG4aMQF0iiAEcRNgZP1bVb6yg6ptLvAfk7fRm+QjPRiIVgIBml0CAe
	ETE+s9rCat45shDjRrzmIkJ071RZmJl0qa+0IyTGC3mpbtSmpFAwzawVuH+2sYHGW+xu3OEb3wW
	kuNp+sn0=
X-Received: by 2002:a05:600c:6212:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-4a02758405cmr139001325e9.19.1791140206606;
        Sun, 04 Oct 2026 11:56:46 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-2a02-3100-a190-7401-a90c-9d77-a1b8-e6a2.310.pool.telefonica.de. [2a02:3100:a190:7401:a90c:9d77:a1b8:e6a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bcf0fsm318633385e9.6.2026.10.04.11.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 11:56:46 -0700 (PDT)
Date: Sun, 4 Oct 2026 20:56:43 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, 
	Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Bradley Morgan <brads@mainlining.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: rust: Enable Rust support for ARMv5TE
Message-ID: <asKgtWX7q-mgvnOc@gmail.com>
References: <20261003093827.77857-1-kmehltretter@gmail.com>
 <20261003093827.77857-3-kmehltretter@gmail.com>
 <CANiq72kGay03jqFOfFcJOjr9Poy+yc2u0=Ep_9LQ+KMy=1JtRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kGay03jqFOfFcJOjr9Poy+yc2u0=Ep_9LQ+KMy=1JtRQ@mail.gmail.com>

On Sat, Oct 03, 2026 at 12:24:35PM +0100, Miguel Ojeda wrote:
> On Sat, Oct 3, 2026 at 11:38 AM Karl Mehltretter <kmehltretter@gmail.com> wrote:
> >
> > Tested on v7.3-rc1 with clang 22.1.8, rustc 1.99.0 and bindgen 0.73.2
> 
> Great to see more arch support! Just to confirm, are there any
> toolchain requirements to be aware of?
> 
> If yes, then we should add them to Kconfig, `scripts/min-tool-version.sh` etc.
> 
> If not, then please test with the minimum versions too! :)
> 

Thanks for suggesting that! No extra requirements as far as I can tell.
I now also test with the minimum versions (LLVM 17.0.1 and gcc 8.1.0,
with rustc 1.85.0 and bindgen 0.71.1).

So far I found one small issue with gcc 8.1.0. A fix for that will be in
the v2 series.

Karl
