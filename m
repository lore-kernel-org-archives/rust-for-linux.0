Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4350CECB
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Nov 2023 03:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ElnjHmAw"
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B797910EC;
	Tue,  7 Nov 2023 19:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=h36Fp+oGSZZThQKXVlSOBuQnKzshdSZBHiXatxwGT+Y=; b=ElnjHmAwWkFuzcNJjP5dtneZrL
	30f02EklI2wvJ0YOQm5TlAG2ilPFzhZzJiYEzkTvITM8h3L7YsV7R2CLjirpZyQ1v0Mg8HexbaMpS
	xbkjGzSQu4yqZFmwwLdNBjLpWcPOKqgMv1HAXL64PtDRK1rRKz8v5ISfLa0bdbQcYZX1jOOlI9Jvk
	dLnkliPurnPOd0PYQK1pNX/eQN/s906JwxaO19gKxNCtHtk5l9FKaNWTzMmmQmWvh+YNJOjZYY3yA
	oyRQfa93Thb+bCIazfCZyNKfFh14nlwq1WRyO0mzbUqrsvx3atI+T9rffPokTc2J40erlIjUiLd23
	n1QoIm4w==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Yp9-002qcW-12;
	Wed, 08 Nov 2023 03:01:47 +0000
Message-ID: <3f0a6313-afe4-4e51-b22a-5728f3d0b11d@infradead.org>
Date: Tue, 7 Nov 2023 19:01:45 -0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] kconfig: Add special rust_modules config option
Content-Language: en-US
To: Matthew Maurer <mmaurer@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20231108022651.645950-2-mmaurer@google.com>
 <20231108022651.645950-5-mmaurer@google.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231108022651.645950-5-mmaurer@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/7/23 18:26, Matthew Maurer wrote:
> Adds support for the rust_modules kconfig type, which works similarly to
> modules, but for restricting or allowing the use of modules which
> directly depend on Rust.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  scripts/kconfig/confdata.c |  3 +++
>  scripts/kconfig/expr.h     |  1 +
>  scripts/kconfig/lexer.l    |  1 +
>  scripts/kconfig/lkc.h      |  1 +
>  scripts/kconfig/menu.c     |  7 +++++--
>  scripts/kconfig/parser.y   | 12 ++++++++++++
>  scripts/kconfig/symbol.c   | 31 +++++++++++++++++++++++++++++--
>  7 files changed, 52 insertions(+), 4 deletions(-)
> 

Hi,

This appears to be a change to the Kconfig language, so please update
Documentation/kbuild/kconfig-language.rst with some prose explaining it.

Thanks.
-- 
~Randy
