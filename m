Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178623176FD;
	Thu, 26 Mar 2026 01:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774487705; cv=none; b=bizauw31FDMfbIaUxBbLXd6Xw55UFkvP2HRV8694l90vIvSvM8SPDm9HymVCkxv/l6OhHwGgc1FRfefdRu1MNu2JkwuldmLsPZUce/zC3iruvnJDhaRyc9ovHKoi/kxgXsBm/eki45gbN0ygUdrETdMg8hBw4DHh/pnG28xy9qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774487705; c=relaxed/simple;
	bh=pJd7VIu8T6ytuoYLU/8L0M4NqwWqvsF6jINIz+xx8VM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=SAVgG6XKncupbl3flo0o8yypaw+o0nImijUfS2pA4/iDGyIy2wyiC83moM+0S4xz7jb/Uo/qbGUyNVo66BrwxOYNni8+U+OtHWN05Zk/Yt3nP7Hvus6LFqAmP2IvW7JqsZ5Mlt3Q9Zqc71cvGlzkCmIHrNVpX9BbKncL3GRILIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IENkgTmB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IENkgTmB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD11EC4CEF7;
	Thu, 26 Mar 2026 01:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774487704;
	bh=pJd7VIu8T6ytuoYLU/8L0M4NqwWqvsF6jINIz+xx8VM=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=IENkgTmBdlGYDsdhZ2+n86H8WxEnX8RMJTrItqqIB4CKZX7dNlnWtvzY1d2W8TetG
	 f3p8OJRu5GHncpxVRmWKHWj9zcqWcfpqU5aqXT1PXVlgWFjfX8Og7Y7S0I6F+NlktO
	 eFMi11p4N0gl+u4Yierf74zaHRoHQfki1jL0/k+UttyLSd5kSFZrGPgqp6oAYVIW9q
	 U0edh3Be6NvioY1wdOvDuFcQZ3LRcQbzi+pLhTfzLJ36tnTr8DPYsR+m3hIBhgcGOe
	 xV8W8m7GoZ3D5DxzkoBQGSiSPOFR87yNUORWP7daYP2B0PGuLw9thcSH9sRag3y1Oz
	 DYspZL5EhsJoA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Mar 2026 02:14:58 +0100
Message-Id: <DHCBE2PV3C2G.O9UJNFQX7E5P@kernel.org>
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
Subject: Re: [PATCH v9 5/7] rust: drm: gem: shmem: Add DRM shmem helper
 abstraction
References: <20260316211646.650074-1-lyude@redhat.com>
 <20260316211646.650074-6-lyude@redhat.com>
In-Reply-To: <20260316211646.650074-6-lyude@redhat.com>

On Mon Mar 16, 2026 at 10:16 PM CET, Lyude Paul wrote:
> +    /// Creates (if necessary) and returns an immutable reference to a s=
catter-gather table of DMA
> +    /// pages for this object.
> +    ///
> +    /// This will pin the object in memory.
> +    #[inline]
> +    pub fn sg_table(&self) -> Result<&scatterlist::SGTable> {
> +        // SAFETY:
> +        // - drm_gem_shmem_get_pages_sgt is thread-safe.
> +        // - drm_gem_shmem_get_pages_sgt returns either a valid pointer =
to a scatterlist, or an
> +        //   error pointer.
> +        let sgt =3D
> +            from_err_ptr(unsafe { bindings::drm_gem_shmem_get_pages_sgt(=
self.as_raw_shmem()) })?;

This is unsound as nothing guarantees that the device used by
drm_gem_shmem_get_pages_sgt() is actually bound to the calling driver. It i=
s
also not guaranteed that the DMA mapping within the returned &SGTable does =
not
out-live driver unbind.

There are two possible solutions.

  (1) Change drm_gem_shmem_get_pages_sgt() to provide this guarantee.

  (2) Don't use drm_gem_shmem_get_pages_sgt() in the first place and instea=
d use
      SGTable::new(), which guarantees to destroy the backing DMA mapping o=
n
      driver unbind.

In any case, this function needs to take a &Device<Bound> argument that mat=
ches
the bus devices stored in the backing GEM object.

> +
> +        // SAFETY: We checked above that `sgt` is not an error pointer, =
so it must be a valid
> +        // pointer to a scatterlist
> +        Ok(unsafe { scatterlist::SGTable::from_raw(sgt) })
> +    }
> +}
