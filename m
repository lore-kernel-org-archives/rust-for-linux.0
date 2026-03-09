Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE90238C1B;
	Mon,  9 Mar 2026 22:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773093710; cv=none; b=RmT/CrwT6LlhAZaDsPveKt6plbup8qB65EYlzwkv36VsYmeuzsQaUSTpbFPh0YxdadBWIEHJ9Yg6TbduYU/O3PicjGwXelgoDq4fJgV2PtbdGivetm5hUfvyLml1Sx21iZjMh+B31Z4URB3qAxi/PsGRdiaTL+wv1vvubG3sW+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773093710; c=relaxed/simple;
	bh=aHvp/ydDvwJNhlqaovNKYyy8F9mwenGS+ySHQYofdzU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=o9Uqcs4Cdulu74vWhT2nQfGBVYgN3fp4pDYl+8fl07s4zOuM0jl+woP2C5y+HMMxK217Sm0sI8jnylsqPA80o+udWVAv8uOyTgLnIaGh8+1TMxsGD5F8oiwj6SDioa294Hffh0e5PT6A91eONMNwa8INsAcEYxO0BAglpHcdeL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RvI5JFp1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RvI5JFp1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53789C4CEF7;
	Mon,  9 Mar 2026 22:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773093710;
	bh=aHvp/ydDvwJNhlqaovNKYyy8F9mwenGS+ySHQYofdzU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=RvI5JFp17G6ngaZ1JKSX0k6cw+FhIcpfRhJVFCPCWuIsAyLXCg2qApKWf6zyOlcp5
	 lnQKIfFWuw7E9kjpU8QDj+RNvYR/1scHUesCsHd7mMwBR5/fPl5HCzgSO42WhDMHnE
	 eQOdaIwdpvZrNRxIfrcwR8a9b9viqE6/Wm4fKPxo+2xG7oq7O2I/Zj43Xoh9YzOB2H
	 eH98HCgXAr2xT48334A7+jDfNmep+IKjz9FJN/4ATcymS6nqd/Pl5i+T5P8V3j2T60
	 RdYpsQLChc3LwHqKaYTbJjIjbE1psl/swPoKPXOL6xDo3E50ZPUMmUjTVl58birVKs
	 2jNNtb+UUAMeQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 23:01:46 +0100
Message-Id: <DGYL9FS1Z00X.2HEJ96J8R3OK4@kernel.org>
Subject: Re: [PATCH 6/9] gpu: nova-core: generalize `flush_into_kvec` to
 `flush_into_vec`
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
 <20260227-rmcontrol-v1-6-86648e4869f9@nvidia.com>
 <093ca23e-7081-42db-a202-0a42c51741a3@kernel.org>
In-Reply-To: <093ca23e-7081-42db-a202-0a42c51741a3@kernel.org>

On Mon Mar 9, 2026 at 10:57 PM CET, Danilo Krummrich wrote:
> On 2/27/2026 1:32 PM, Eliot Courtney wrote:
>> Add general `flush_into_vec` function. Add `flush_into_kvvec`
>> convenience wrapper alongside the existing `flush_into_kvec` function.
>> This is generally useful but immediately used for e.g. holding RM
>> control payloads, which can be large (~>=3D20 KiB).
>
> Why not just always use KVVec? It also seems that the KVec variant is not=
 used?

(Besides its single usage in GspSequence, which wouldn't hurt to be a KVVec=
.)

> If there's no reason for having both, I'd also just call this into_vec().

