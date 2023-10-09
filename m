Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C312417745
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 14:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="nFpfho4+"
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 744B89E
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 07:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1696863270; x=1697122470;
	bh=ymlaUVVXJ+Th4cNPzJgcV4MwmbIo6pX1Ds9YjsPWOLw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nFpfho4+A48XTr/+ObS3l7NWx9W3mSLKvweAC1P77ZAZOOYT6SDeh2zoPnDG4j88H
	 SRw5kphw9F75gRdyCUUr8/zOM8uxBs9/JXR6F/RmoaAhvJHRMBfrM2dmWlwO3K8IgU
	 6y0rKFXrMYsQXxunHHAVpJQkf2Dtk5u+QMDsUH8aE6dHFNtN0+e31X+8QS9sHt1vkx
	 /Yay3PyzdV6AdFr9m3f/hAxVNtLsR/Z/sM64B/fmeoi+9MolSD9qEueGeDfPi8yFhi
	 eD61AwMwZH3dX5f/IbijSTD1dguHuER8JzSIb3MXHNhvaoUMsBxATuAhksplpVejxr
	 62PAsZ5ohOaIg==
Date: Mon, 09 Oct 2023 14:54:25 +0000
To: Wedson Almeida Filho <wedsonaf@gmail.com>, rust-for-linux@vger.kernel.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org, Wedson Almeida Filho <walmeida@microsoft.com>
Subject: Re: [PATCH] rust: error: fix the description for `ECHILD`
Message-ID: <5122b6b6-12d5-0337-0c04-3e30da1f3898@proton.me>
In-Reply-To: <20230930144958.46051-1-wedsonaf@gmail.com>
References: <20230930144958.46051-1-wedsonaf@gmail.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 30.09.23 16:49, Wedson Almeida Filho wrote:
> From: Wedson Almeida Filho <walmeida@microsoft.com>
>=20
> A mistake was made and the description of `ECHILD` is wrong (it reuses
> the description of `ENOEXEC`). This fixes it to reflect what's in
> `errno-base.h`.
>=20
> Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
> ---
>   rust/kernel/error.rs | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index 05fcab6abfe6..bab2c043fc42 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -37,7 +37,7 @@ macro_rules! declare_err {
>       declare_err!(E2BIG, "Argument list too long.");
>       declare_err!(ENOEXEC, "Exec format error.");
>       declare_err!(EBADF, "Bad file number.");
> -    declare_err!(ECHILD, "Exec format error.");
> +    declare_err!(ECHILD, "No child process.");

Strictly speaking, `errno-base.h` documents this as "No child
processes" (note the plural), but I am fine with taking it as-is.

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

