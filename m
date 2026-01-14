Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8B43A0E88;
	Wed, 14 Jan 2026 15:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768405712; cv=none; b=ZsCEykgGtuOlcbOmcGrMmMVu7iMzWULic1IZPszy2TFrF+LZ3Nlkh3LBHRW8YLGTsc+9SISCeWgNxdzrny5bcwzZz2u6Nn07n8rkdQ30SoAdRcdAD7wzFdT6E3HQL1vWhrHixNN/5R1eV+vIxKSBpx0blhN8te296aet1AZWy9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768405712; c=relaxed/simple;
	bh=8IbDw6JIf5y5KNZZ0yjTsWlJb11+I0e46PEUBjbG/A0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RNzvF7UAZ22YY2tksfFi27p7M5ztoE4gIBBBvRvfwt606LOD0ks/TJo6q5afwggzpHLWIkJRYq+W3zZX23nyDTzA48jDNtBOQUnXumafnMR/rPlEo/vfv2/3sGfHBxVtSgxBJDlZj2qd9MwIIl62cnYeqOmYS1JKYBMrc0fqlS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HRV9Zu+a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HRV9Zu+a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B535C16AAE;
	Wed, 14 Jan 2026 15:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768405711;
	bh=8IbDw6JIf5y5KNZZ0yjTsWlJb11+I0e46PEUBjbG/A0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HRV9Zu+aoqyOfAJtE7PyCN6eNf3zoNUC9Yo0V92GzpqcKiEVqRNzEmdhnjcMolrHG
	 jGd8hjdPzkqsNiqDd79k0kLToxvjQFlRS3LMQWOxIIXLqDALQrdWg7di5rW8P75jvH
	 vzV2gdkGMBFwECAT5p0qGVkndTYMUbW/6Pta0iHm8iSfiSNyTLiVZ5Lwv6fL19BS6U
	 iXGHQclfPgLYU9nRgMoM2w1Hzf5h9zVYtS/gkjjBdQTouImvoiduDN5DkzyJeqeK33
	 on+581MZTm7RLyZkNUwcooePI7EuZyahy9YyPqSoyxKbY9M5kCK3U019gmFSybkBOn
	 1h1BVVivYATZA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 00/15] `syn` rewrite of pin-init
In-Reply-To: <20260111122554.2662175-1-lossin@kernel.org>
References: <0_JVrevJeDexgBCPJKUDqVKcopDMZyU-kLN9o-1502Av94rIL4O1fyItT1kC8-P0J9FbvciiNqZWf9lzMq6fUg==@protonmail.internalid>
 <20260111122554.2662175-1-lossin@kernel.org>
Date: Wed, 14 Jan 2026 16:48:20 +0100
Message-ID: <87o6mwfb5n.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Benno Lossin" <lossin@kernel.org> writes:

> Rewrite the proc-macros of pin-init by using the `syn` crate for Rust
> syntax parsing. This series has been a long way coming. At the very
> start of pin-init, I initially implemented everything using syn, since
> parsing is so much easier with it. Now after several years it is finally
> time to remove the dreaded 1600 lines of declarative macros required to
> parse and expand the initializer syntax.
>
> The move to syn is not only a blessing for the maintenance work, but
> also improves the implementation of new features. This series includes
> many such improvements.
>
> * Patch 1, 2, 3 and 4 prepare for the rewrite. The first removes the
>   superfluous `try_` variants of the initializer macros from pin-init.
>   Note that the kernel defines its own, so no code changes in the kernel
>   are required. The second patch allows using `::pin_init` in the
>   pin-init crate. The third adds the syn dependency and cleans up some
>   old workarounds and new clippy warnings. The fourth adds better error
>   handling on top of `syn`.
> * Patch 5, 6, 7, and 9 rewrite the derive macros for Zeroable,
>   `#[pinned_drop]` attribute macro, `#[pin_data]` attribute macro, and
>   the initializer macros respectively using `syn`.
> * Patch 8 ensures soundness in the future by fixing generic bounds in
>   generated code by `#[pin_data]`.
> * Patch 10 adds the `#[default_error(type)]` attribute to initializer
>   macros allowing them to specify a default error that is used when no
>   error is manually specified.
> * Patch 11 uses `#[default_error(type)]` in the definition of the
>   kernel's `try_` variants of the initializer macros (which defaults to
>   the kernel's `Error` type).
> * Patch 12 allows putting attributes on fields in initializer macros
>   (for example `cfg` attributes).
> * Patch 13 adds `#[disable_initialized_field_access]` to support packed
>   structs.
> * Patch 14 simplifies the code generated by the initializer macros.
> * Patch 15 adds Gary as a maintainer.
>
> In addition to the new features, using syn results in much cleaner error
> messages and more accurate span information. The code is much easier to
> read as well and hopefully easier to understand as well.
>
> As always, tests that ensure the correctness of the macro output are
> included and updated in the upstream pin-init repository. Take a look at
> the pull request on GitHub for the diff in the test output:
>
>     https://github.com/Rust-for-Linux/pin-init/pull/89
>
> I would greatly appreciate Tested-by's from people actively using
> pin-init weather in the kernel or outside.
>
> One thing I forgot to mention last time: the commit adding syn support
> to pin-init is also used by Gary's series to rewrite the `macros` crate
> using `syn`:
>
>     https://lore.kernel.org/all/20260107161729.3855851-1-gary@kernel.org
>
> My series can be found at:
>
>     https://github.com/BennoLossin/linux/commits/pin-init/sync
>
> The rust-dev branch in the RfL repository will be updated to contain
> both patch series for ease of use & testing.
>
> Link to v1:
>
>     https://lore.kernel.org/all/20260108135127.3153925-1-lossin@kernel.org
>
> Cheers,
> Benno

Tested with downstream rust null block driver on v6.19-rc5 [1]. No issues encountered, and
conditional fields now work, yay!

    #[pin_data]
    struct NullBlkDevice {
        ...
        #[cfg(CONFIG_BLK_DEV_ZONED)]
        #[pin]
        zoned: zoned::ZoneOptions,
    }

    try_pin_init!(Self {
        ...
        #[cfg(CONFIG_BLK_DEV_ZONED)]
        zoned <- zoned::ZoneOptions::new(
            zoned,
            device_capacity_mib,
            *block_size_bytes,
            zone_size_mib,
            zone_capacity_mib,
            zone_nr_conv,
            zone_max_open,
            zone_max_active,
            zone_append_max_sectors,
        )?,
    }),


Tested-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg


[1] https://github.com/metaspace/linux/tree/rnull-v6.19-rc5

