Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4451A725
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Oct 2023 15:12:46 +0000 (UTC)
Received: from gimli.kloenk.dev (gimli.kloenk.dev [IPv6:2a01:4f8:c012:b874::])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A08B9A6;
	Mon,  2 Oct 2023 08:12:44 -0700 (PDT)
From: Finn Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1696259561; bh=eerMweugb1e+pAObgiSP70IzG+W20gWNH6v/k+kjU9I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Llw38KDq7Ef2Hi3lEOXA+EXY77PvI1geg3x55MsJF6Z9zQbpXVaYfHxK8vi6TW/5L
	 AHs/t/BEnN7oIZGhO1++B85t5VmMA7ww7SJs0t04I2ZVOrJqHv9JjcPYQLGijQzwZa
	 GU641tTrYMLn6KQGZUIgjC/ApCeifxFrGLu8/w00=
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>,
 linux-kernel@vger.kernel.org, Wedson Almeida Filho <walmeida@microsoft.com>
Subject: Re: [PATCH] rust: error: fix the description for `ECHILD`
Date: Mon, 02 Oct 2023 17:12:39 +0200
Message-ID: <5F69306E-719A-41CD-B58C-63D79D35B1E7@kloenk.dev>
In-Reply-To: <20230930144958.46051-1-wedsonaf@gmail.com>
References: <20230930144958.46051-1-wedsonaf@gmail.com>
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



On 30 Sep 2023, at 16:49, Wedson Almeida Filho wrote:

> From: Wedson Almeida Filho <walmeida@microsoft.com>
>
> A mistake was made and the description of `ECHILD` is wrong (it reuses
> the description of `ENOEXEC`). This fixes it to reflect what's in
> `errno-base.h`.
>
> Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
> ---

Reviewed-by: Finn Behrens <me@kloenk.dev>
