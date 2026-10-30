Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793387001;
	b=EwLD7hGEyuKIE9IAhfkWXF9w7MWIW67yCGzA13Xf9qWwqGIVV+cunexewrZ9zvXx505Q
	 0QODqja69BgtxoRcQUnOenLpHEvwtwwPDj5pTgrLs1ZT49LNZHbihP8Ssw7+BcE1C18ax
	 EbFV1dOmTQeGB7Cgmga6CYBCyGgjLTUBPwJ0FFpP2mcEg0ZqjrsGRe3D5iy8sV/O1Uka7
	 vg9ffgjVd3zYkRdEVRlIArJLd4ubO0FxceUYbWlYe6CfiGSTu5HmXW5rI3Y7mMW9WLgO0
	 YqLGRNtJjU9vWg5S4F7s8ROR3No+0YzRmJpSSB4g2o+lFozUgSNn/TaNLfNjP5X/7xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793387001;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Ez6NwxCX3bhjDqnSlRsdUj2bvOIZ+33wXUFtZScIV1g=;
	b=eFexuT+7m9zMoih6UFQB+fhUbfwPJJJgomxXID3J9Gsh4wYgY04/boBIrr5rpcSlzqW0
	 /gRtaey/MeizbPsATud+z1cCCegmZqtQb1OIeYngOVmWpmTmJalCITgcWfZGrdBn2WYep
	 y8iUyXfWYpOtXfUHEqTSX9Ua4670s4e9ej5jITuqYqmpLSxbimtFJa5Pdkx3tILaEdiop
	 CvnI3yNnHA2+XxDIlualh4B0JRMF8UN9dATmd2osqZX9ziwr/Ag+FLH/FzWB4x6sD430X
	 TTcxCDU+oMH3mKklONKcCVNUDr15PCzGjceqJQ/A80+4mXlYFwRrwbBi39hPCiT8YvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jR83Kb9q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C764606A324
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 19:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jR83Kb9q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B801F0093A;
	Fri, 30 Oct 2026 19:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793387000;
	bh=Ez6NwxCX3bhjDqnSlRsdUj2bvOIZ+33wXUFtZScIV1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jR83Kb9qrDLc0R4usVOoKB7Wfomia0GqfF81Td+WbSHwwVFRLIPdKI0/vKgHbGgWb
	 P1USucvboR+nddAxF/OZRMK0Ew55gkfE1rvvVBGUVExEc2cV8sn1eu2xRsK9P1spXk
	 yJ9adP/RhRcn4iySwKESga8MO710jC2KbtLMkP6FIVF8zKe1ggfp4QqKW4fMKAsQA/
	 Yv4GQKGycK1FLwZ7Iwocu8SdRhjktGPMiUryhwcZkZ+QdtHDmj2WqfBmBfEn7klP5i
	 qUl34fTmuMFxpxGecnNqx2fq5PohsF6Onpef8NtsZOeWT9wJuU8MwdIbKZyq/QQpIj
	 KkXBSPPmT9bDw==
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id B9037F40068;
	Fri, 30 Oct 2026 15:03:18 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Fri, 30 Oct 2026 15:03:18 -0400
X-ME-Sender: <xms:9unkaooeMLGQ8g__Yi_Sp3XCPOy2OpomnXvZRNPjlr1ULv5uB9nIzA>
    <xme:9unkaheo5QsXe81j1maoi8DP5KLFJLNFlATKcO2b6F5oDTLY5AKD_UwxA0fv8yZiJ
    nWfUMVF9DG1EdD1UDuhoyLj0zuzqe0PCqIkY6fOJnUJwIgNMMq44w0>
X-ME-Received: <xmr:9unkav9EdI6EqdoQ0dmgg7l9dskWNX_tVFTPW2QAk-RQhGKOZs0ekdyqVd854PweoGpCjv46HP3pkUa0-qj3WXFlo9js3z3b>
X-ME-Proxy-Cause: dmFkZTFGOr8QamtD/idwG8XBnzFAf/Ml7EAwCH31rnH8844AjLaVjcYoNBFy7nItSr7/1R
    lKLHkptekXrYmhAKtgQ1Z+R7VAqLBCvvhIKid69nwHnmkXXVXREiZZ8oE4ml2ZXua7p2aW
    mQmAcy/zMr6ozkc6UBBgKuOc54G/Nq6wmDswdE2iZ0oNX0nyv77LixT1rJuAK86uLRkCrb
    zpq8drx/483k+MkNQIfPcPZt8SIm44QxOvs9tyx1C5HtY485ysmDgaVxenlJAEBQO1QXf2
    BQP+bfx7YLCr4UXJwZyyw6DeHKCAymUkdVUdgSFkV8FTLEwqfnvsgNQ/CBKWOkZyfPJpAO
    Al4yqBIi7gDBRnRpWOZHTMHspW3NbHnz3tfkJ3uE049XnujAFSjZJFrNTUoDrSiUfhUocU
    kbq/qJbDFNqTeqiE6KWjoGMgjRVFA6SGNk/kf8Q+8QqSShsOA6RZdm4Dq19laUOOpJLUel
    nldBdI3ybTOTjroLAAHFHhnIR4AdGLgsir3ATgNlzUnP2589vKropgG7sOAuRtGqomh9XH
    E9AlB5DHJFs34LLa/aIuFUBU71dMXYbEzW3vHDtoFyV4WEL1UiyAwRUUUELS6S/jP3YuB/
    cnPbmCCSGKyWLaYixZ+A7AgPcyZ9Wej6qrDumo8qHFJv74joRgAvSZRQfiNg
X-ME-Proxy: <xmx:9unkajaqVwjO98a_kB8ukEVY-GkrneZIY2guhFSvWSHT8m8DQihEnQ>
    <xmx:9unkai2TplNQ0-PjlG0U0l6N92k42R7ab6SMaKsynSZLjwjJEH8tjA>
    <xmx:9unkas1addTZKN7Pb3QzqxS_p4Mo4__0BoaiggYCFODftputQTsSAw>
    <xmx:9unkav5Gm7dSWC8H-tw447T8lU9EBQh6SLVRNXAvrj7gB9nroVFb4g>
    <xmx:9unkar0o4mYr0XXO4IoznNFiFH31Ue39lsZ465Szl1SAs7-NHZB5_p2S>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Oct 2026 15:03:17 -0400 (EDT)
Date: Fri, 30 Oct 2026 12:03:16 -0700
From: Boqun Feng <boqun@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Yury Norov <yury.norov@gmail.com>, Yury Norov <ynorov@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v4 1/2] rust: add a wrapper for the `nr_online_nodes` C
 function
Message-ID: <auTp9HYxHde2IONT@tardis.local>
References: <20261030-cpu-helpers-v4-0-a8d840d34837@kernel.org>
 <20261030-cpu-helpers-v4-1-a8d840d34837@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030-cpu-helpers-v4-1-a8d840d34837@kernel.org>

On Fri, Oct 30, 2026 at 05:08:03PM +0100, Andreas Hindborg wrote:
> This function returns the number of online NUMA nodes.
> 
> The wrapper is needed by the Rust null block driver.
> 
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Yury Norov <ynorov@nvidia.com>
> Assisted-by: LLM
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/lib.rs  |  1 +
>  rust/kernel/numa.rs | 29 +++++++++++++++++++++++++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 4d5c96ddc49c..a7b1c9cf454f 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -105,6 +105,7 @@
>  #[cfg(CONFIG_NET)]
>  pub mod net;
>  pub mod num;
> +pub mod numa;
>  pub mod of;
>  #[cfg(CONFIG_PM_OPP)]
>  pub mod opp;
> diff --git a/rust/kernel/numa.rs b/rust/kernel/numa.rs
> new file mode 100644
> index 000000000000..164e622d325f
> --- /dev/null
> +++ b/rust/kernel/numa.rs
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! NUMA topology utilities.
> +//!
> +//! C header: [`include/linux/nodemask.h`](srctree/include/linux/nodemask.h)
> +
> +use crate::bindings;
> +#[cfg(CONFIG_NUMA)]
> +use crate::sync::atomic::{
> +    Atomic,
> +    Relaxed, //
> +};
> +
> +/// Returns the number of online NUMA nodes.
> +#[inline]
> +pub fn num_online_nodes() -> u32 {
> +    #[cfg(CONFIG_NUMA)]
> +    {
> +        // SAFETY: `nr_online_nodes` is a global variable that is valid for the lifetime of the
> +        // kernel. The C side updates it with plain writes during node hotplug and reads it with
> +        // plain reads. A relaxed load is the Rust equivalent of `READ_ONCE()`, which is the best
> +        // we can do on the reader side.
> +        unsafe { Atomic::from_ptr(&raw mut bindings::nr_online_nodes) }.load(Relaxed)

Just so you know you can use `atomic_load()`[1]:

	unsafe { atomic_load(&raw mut bindings::nr_online_nodes, Relaxed) }

With or without this:

Reviewed-by: Boqun Feng <boqun@kernel.org>

[1]: https://rust.docs.kernel.org/kernel/sync/atomic/fn.atomic_load.html

Regards,
Boqun

> +    }
> +    #[cfg(not(CONFIG_NUMA))]
> +    {
> +        bindings::nr_online_nodes
> +    }
> +}
> 
> -- 
> 2.54.0
> 
> 
