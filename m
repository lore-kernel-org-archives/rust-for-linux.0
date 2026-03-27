Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AB73644BB;
	Fri, 27 Mar 2026 20:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774644282; cv=none; b=U/BJWEEQn8hTC9nxA2vH6aUzJFX5Q9Nse/C253RZ09hWPo0WWDXHPOPIGOk0j17ku3XdJet4JsAG0OJOE/nETDDmfP8m+XqBtxInLsh8Vww/0ZWL7ssCRn8EQQs+ZHv+Tc6dmlnGnqwn4E4dRqzufOU6fM3p31BnKXDBlOifdPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774644282; c=relaxed/simple;
	bh=pjtXtS4Kx1HfchVm/8WjMLE03rpfeGZ+zPWKpQMasjk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=kwiBO3ndovmyHOlntCspbyWrfyGuTMM3rhF1F7gSZd61oi+cEj2zzwfW/FqVHU9jZXkc1ZEi+SnFdjhr2je5idG+usikjrWo9Au9/BAH6pqBQwmsC/aCKlPsTQuNJnDtAMXmoHENI+AHWwZicLaPLBoXMs9InO22RjpMb2+Dbdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=skL+bkV2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="skL+bkV2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB83C2BC86;
	Fri, 27 Mar 2026 20:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774644281;
	bh=pjtXtS4Kx1HfchVm/8WjMLE03rpfeGZ+zPWKpQMasjk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=skL+bkV2aB0KvWcJBOwBREVSIwrLBax9k1RDfFi2webQZzKwy2F7CY5MfU8uGwAlI
	 OgI5LnXoCigdAkh7QSEdsC0E2nEzUxLqZ12gKKsmtwNQ3idSwjHYdUN4V/ZrQtfsoW
	 bIk6k4X6rXZccNVJIkK1O2NQOpzm2065LEF3HO/gTtYahH2w7K3iECROEkpMvxbsj8
	 taj8vdbVpxuy6aHmILLO1erHo/6LWQPfkZoLD2jEPcZVWiv8+1cFTO2sJju2zaUvlE
	 XaqXMSjeM4yDaFYKMtJzW5UpSJUh5Q9t7QKL4gpjpjiU5YXW9Beenjlfrce8UnkorA
	 +rGkRWqd4mOcQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Mar 2026 21:44:35 +0100
Message-Id: <DHDUW55OWUU6.2YPVSZVHGYPI3@kernel.org>
Subject: (subset) Re: [PATCH v9 0/7] Rust bindings for gem shmem
Cc: <nouveau@lists.freedesktop.org>, "Gary Guo" <gary@garyguo.net>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, <rust-for-linux@vger.kernel.org>,
 "Matthew Maurer" <mmaurer@google.com>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, <christian.koenig@amd.com>, "Asahi Lina"
 <lina@asahilina.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Alice Ryhl"
 <aliceryhl@google.com>, "Boqun Feng" <boqun@kernel.org>, "Sumit Semwal"
 <sumit.semwal@linaro.org>, "Krishna Ketan Rai" <prafulrai522@gmail.com>,
 <linux-media@vger.kernel.org>, "Shankari Anand"
 <shankari.ak0208@gmail.com>, "David Airlie" <airlied@gmail.com>, "Benno
 Lossin" <lossin@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>,
 <linaro-mm-sig@lists.linaro.org>, "Asahi Lina" <lina+kernel@asahilina.net>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, <kernel@vger.kernel.org>
To: "Lyude Paul" <lyude@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260316211646.650074-1-lyude@redhat.com>
In-Reply-To: <20260316211646.650074-1-lyude@redhat.com>

On Mon Mar 16, 2026 at 10:16 PM CET, Lyude Paul wrote:

Applied to drm-rust-next, thanks!

> Asahi Lina (2):
>   rust: drm: gem: shmem: Add DRM shmem helper abstraction

    [ * DRM_GEM_SHMEM_HELPER is a tristate; when a module driver selects it=
,
        it becomes =3Dm. The Rust kernel crate and its C helpers are always
        built into vmlinux and can't reference symbols from a module,
        causing link errors.

        Thus, add RUST_DRM_GEM_SHMEM_HELPER bool Kconfig that selects
        DRM_GEM_SHMEM_HELPER, forcing it built-in when Rust drivers need it=
;
        use cfg(CONFIG_RUST_DRM_GEM_SHMEM_HELPER) for the shmem module.

      * Add cfg_attr(not(CONFIG_RUST_DRM_GEM_SHMEM_HELPER), expect(unused))
        on pub(crate) use impl_aref_for_gem_obj and BaseObjectPrivate, so
        that unused warnings are suppressed when shmem is not enabled.

      * Enable const_refs_to_static (stabilized in 1.83) to prevent build
        errors with older compilers.

      * Use &raw const for bindings::drm_gem_shmem_vm_ops and add
        #[allow(unused_unsafe, reason =3D "Safe since Rust 1.82.0")].

      * Fix incorrect C Header path and minor spelling and formatting
        issues.

      * Drop shmem::Object::sg_table() as the current implementation is
        unsound.

        - Danilo ]

>
> Lyude Paul (5):
>   rust: drm: gem: Add raw_dma_resv() function

    [ Fix incorrect reference in safety comment. - Danilo ]
