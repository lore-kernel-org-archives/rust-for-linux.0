Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944429;
	b=UCmuV+FimdxHnIGUoM1xcxgz0BvN93B21AtxamCkZ1dedPIPYlg6qoOkTAUHEN2Q9rd/
	 k/gk9GWVWqa6V6+EW0mwbbyHM6Pjg3d7dMLXclYDG2vVJQ1yfq+IL+HP5y+M+O0VizfAL
	 BURdU2YontzYoJlWdpxZa+Wdd+KR9hWBchN5PTSeoRNYaLqxMovn18VfiigCCDRDZljKK
	 4BLiNFfRktJXodU0Ozf2KZCYg4Vk9uAGDYtiOpksq9BTSCtJhef5uIm5Y/uB0625D0KZc
	 qgWGk/Y4B/b/ma2OhOfJ163Qs7NToyE0M2lv2UAvXRfcsHh3PPn2sODx/KrPNjgp6EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944429;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=AOjEhOx7nc0rqRDX2rEwBPS9rvUhLYdv9/828tsqc4A=;
	b=ij/0Y/tthwXc8IsYPfb750M3RM7F0625QD4jIqbYmnJrbmkEam456EXgUYGbZhzHoGGL
	 P03uxriMQMSF2vikRUpNPF4x0TrbSAkSE9nXFDxSzc77qDdu3l/K6V39qwxHm5frfMiiB
	 W668DUOt9cAeA7yGqAuEXYYN22L+S1AxcDNAzdr286H7Mgi8hkMwzVWJNS39k4OdlNKB+
	 ZO+nRz7coDMUwXarJJfk5UPo1aoMcykcrEjXUgi4MT7PSnpB3RUwb6Rc+MDQwJMgiy+ZO
	 z8Yvsz652yx2UUrBqsPMgDnb99TlaD5qdeJbH8MiLPdWAC5PDf3B8T7tf3+4J4ox79Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HiUx6s2w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49F8606A31C;
	Tue, 17 Nov 2026 19:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HiUx6s2w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95F7E1F000C6;
	Tue, 17 Nov 2026 19:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794944429;
	bh=AOjEhOx7nc0rqRDX2rEwBPS9rvUhLYdv9/828tsqc4A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=HiUx6s2wFOwyt9W0rl5rOyylKedCpT4P2lG8rfsAAe6eq2hPXaOtiAMRdxjzgKOr2
	 ittIsh9sgbgiL4uUdmFCgaa7/reTxEqx/tG8IkJj6DOyvX0fKDxQByOPxFpNIg61FG
	 xn4cHzR62VLHfKcd2oMIvcb+dei8PaboG/eAZ3vsnDUwShkVnr3vRCyXJDdpmgGsvJ
	 1/zujI1EXIw0xNg8zDJFxGikrHx0q3S/cXK1w1Bh1GQopqqbPJz3lrGljZd4gFnU/j
	 iFpTPds4Mi/Nux3BRE9Nz8X8+3OCAc3T1LFqz8uepCBx+yNF/TQ533Ol7Nvhps4uX1
	 SZSpCeRf74sxQ==
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfauth.ams.internal (Postfix) with ESMTP id 14028198003A;
	Tue, 17 Nov 2026 14:40:26 -0500 (EST)
Received: from ams-frontend-01 ([10.64.2.36])
  by ams-compute-01.internal (MEProxy); Tue, 17 Nov 2026 14:40:26 -0500
X-ME-Sender: <xms:qa38ak2l1VHLI0YjrkJ7yIDHaDvb6Umqk-AwnQ6qP9O5XwK_ITDkUA>
    <xme:qa38aqGgUmX-I6UAQqiyENe6ODIrETKYqGMkaTBLRlaj9JxFLb6Mcdc6oC5IYf6B7
    yICAo17ni_HBEu7PSwbBi7NI842BSJM604T9beT-oXt3CGA4BjVqLs>
X-ME-Received: <xmr:qa38ajhds-GI7AczEaBnMFKXeNbpcm0Cha7a2R-6GxMvhQUVPTiAKJ1R2YDaRsvxvg>
X-ME-Proxy-Cause: dmFkZTFsrfDeQ92qWVnVmv/A03PGHmgqhc+/VThcWI16PXDaqJEpPWMO/+iSRVlTIUIgeQ
    4UN4PEubZ/GbB0VxltHySxCGYpIwIJZh7tBpboDS27htJYCHkFY3YAsMwqF/FLnrwW9vre
    N0gz4IpdKEL2lQvFBb5QWAXkT6xNCFM12Ly1YGRP3yX/LgNVblCS3bWyoyj+M3+6UUnf+q
    owuSwdxA34D1vsEHC6QWUkQfRBnjeDd7Rau67zBDB6mDV+TmbKaS1FOYh4RkGQaodea0uq
    m5oYNwq/9EX4gLzM8slcZoAqBg3WwBmWaldbXOJlysT7VKdK026GF1279mOECcDhhLsRha
    YVnYOwEeUM4byvgXMx867f+fgVn1vHF0lM7iaHyBf+CmUisddvhPVr5NvKih1gUR8JaTWx
    2o0wur1GMX3A7a1kTypFPmA5RXjGA2tf9r7abOpaD0ch6ZBDVYoWUdrvAWetftF8U6MzPs
    y/SvdVu5WXjqWho9f5xCNj44szlPlaM3AiCXJKsDpYhTg/SXROIaIA8F7hWAw5iBY0z6+9
    G0zhmyax4l9LBTbWN682qWUDdrA8FgjKY/MatvOQxZ+GgKFSfgV5SrSnmIcjlED/nMHHxB
    x6bMlQOmlbHK8XkZzXOYe2Nw/AG6eZartAdwZQs6o2TZJiaazinPTjm6++LQ
X-ME-Proxy: <xmx:qq38arcSCL55LZZUuCVmjZCcHKgtDJQ7muAlpws1s6fRphm2AFPbaw>
    <xmx:qq38ahyI5WwkKXNtf6Ny5yg-O3AWLZSco8OeSZBwjMorO9NkRmJVZQ>
    <xmx:qq38atZKdrBWMl7p-2XnFjz-9MT0E75JkgX9cDxUkcNCef8DVfXLPQ>
    <xmx:qq38anJtLCPY-GQJJ6JPkOTEggK8NfIW0IP4a673UU6eBt1I5CFwIg>
    <xmx:qq38as2gszjwSBCUBDRIqunl6sqkTQZ8KZZC_WlxbF6t_Ficb2agyuJs>
Feedback-ID: i78584a88:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Nov 2026 14:40:21 -0500 (EST)
Message-ID: <0d26baaa-92ae-43ff-9a76-a81cad624dcf@kernel.org>
Date: Tue, 17 Nov 2026 20:40:20 +0100
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] rust: drm/gpuvm: add GpuVa::data_ref accessor
To: Alice Ryhl <aliceryhl@google.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Deborah Brouwer <deborah.brouwer@collabora.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <20261117-tyr-remap-2mb-v1-0-2a8efd4c8180@google.com>
 <20261117-tyr-remap-2mb-v1-1-2a8efd4c8180@google.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20261117-tyr-remap-2mb-v1-1-2a8efd4c8180@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/17/26 8:32 PM, Alice Ryhl wrote:
> From: Sami Tolvanen <samitolvanen@google.com>
> 
> Tyr's VM_BIND remap path rebuilds page-table mappings for the fragments
> that survive a split, and those fragments must keep the protection flags
> of the original mapping. Add GpuVa::data_ref() so the remap step can
> read the VaData of an existing mapping.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> [aliceryhl: split into separate gpuvm and iommu commits]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

One question below, otherwise:

Acked-by: Danilo Krummrich <dakr@kernel.org>

> ---
>  rust/kernel/drm/gpuvm/va.rs | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/rust/kernel/drm/gpuvm/va.rs b/rust/kernel/drm/gpuvm/va.rs
> index 46493f0ec5a6..f81302faba61 100644
> --- a/rust/kernel/drm/gpuvm/va.rs
> +++ b/rust/kernel/drm/gpuvm/va.rs
> @@ -87,6 +87,12 @@ pub fn obj(&self) -> &T::Object {
>          unsafe { <T::Object as IntoGEMObject>::from_raw((*self.as_raw()).gem.obj) }
>      }
>  
> +    /// Access the driver-private [`VaData`](DriverGpuVm::VaData) associated with this mapping.
> +    #[inline]
> +    pub fn data_ref(&self) -> &T::VaData {
> +        &self.data
> +    }
> +
Why data_ref() instead of just data() or a Deref impl?
