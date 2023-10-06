Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3C97466
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Oct 2023 08:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="kC+paVnE"
Received: from gimli.kloenk.dev (gimli.kloenk.dev [49.12.72.200])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD974CA;
	Fri,  6 Oct 2023 01:17:39 -0700 (PDT)
From: Finn Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1696580257; bh=jL9Cvn3jOWtCuvrpHLfOytSfWh/AL1jcHcmmgJtLJnc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kC+paVnEw1PgeSfbRvfxaAVNmlCWkIxDLxq1V/A3l+/Nph5WK3Qo4Fs2h1/Wu1BPD
	 /8g54/hijYHeiHanjrvG9ABgY1jC1T+gG4mCu7B9a7zq6w0YIPEKCz+W/J8DQRHBAQ
	 p/ZbaFXa3o23rNaGocSxFKKyQ/Z6ya4FHunRrgZ4=
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev
Subject: Re: [PATCH 1/3] rust: task: remove redundant explicit link
Date: Fri, 06 Oct 2023 10:17:34 +0200
Message-ID: <33883770-3AC4-4D67-84E6-E97F8FB164A3@kloenk.dev>
In-Reply-To: <20231005210556.466856-2-ojeda@kernel.org>
References: <20231005210556.466856-1-ojeda@kernel.org>
 <20231005210556.466856-2-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 5 Oct 2023, at 23:05, Miguel Ojeda wrote:

> Starting with Rust 1.73.0, `rustdoc` detects redundant explicit
> links with its new lint `redundant_explicit_links` [1]:
>
>     error: redundant explicit link target
>       --> rust/kernel/task.rs:85:21
>        |
>     85 |     /// [`current`](crate::current) macro because it is safe.
>        |          ---------  ^^^^^^^^^^^^^^ explicit target is redundant
>        |          |
>        |          because label contains path that resolves to same destination
>        |
>        = note: when a link's destination is not specified,
>                the label is used to resolve intra-doc links
>        = note: `-D rustdoc::redundant-explicit-links` implied by `-D warnings`
>     help: remove explicit link target
>        |
>     85 |     /// [`current`] macro because it is safe.
>
> In order to avoid the warning in the compiler upgrade commit,
> make it an intra-doc link as the tool suggests.
>
> Link: https://github.com/rust-lang/rust/pull/113167 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---

Reviewed-by: Finn Behrens <me@kloenk.dev>
