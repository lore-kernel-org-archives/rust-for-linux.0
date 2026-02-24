Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C2619CD03;
	Tue, 24 Feb 2026 15:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771946278; cv=none; b=EMMCjfW44HRBomQGSrgN5D7CTb/F5Z+T7rT2cuSaYOiJFXj6KKE/mqKVU+Y3zXC28C6qhOAcZPEoLYePvC/6NiG8kQJb2rPd9cXzSD0E+3P662OlAScHaBxmHL2/IxDDc6nA+QjX9B6zt/y2QXvpDr6ZEn+fafH0OyHaNTT65Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771946278; c=relaxed/simple;
	bh=k3N/vd40enqMMT89P1TLVRdYiLX5I5osWJ+lOGt3SEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LOm7k/H99O1NpQjkR7cXkIe91aaETOZ8Ho7CPjC4xjm8Y2DN1Jg53e/D+pv0tEc0ao/ME9QGsv6zK2EAVIXeGihtJXvvhBsjul5OZuDkj0dyrB72xJ+CSDwsFLmrj7AQEgZbSkzw5fFCaa3IAQot5WTS+z2BM4ltHXpDXc8ROKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KgsDFa+z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KgsDFa+z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67130C116D0;
	Tue, 24 Feb 2026 15:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771946277;
	bh=k3N/vd40enqMMT89P1TLVRdYiLX5I5osWJ+lOGt3SEw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KgsDFa+z+xoT2iZt4ng+aFoc3vLlgISdSfmUXJ94Xx52ZZNNL1TPY+aOls3eYlerJ
	 DSrou98dof8OlFon+3pbBJL4MWeIvg8Er/vF3I/gRmAAMrjpi7g3VvHjEMFI0woFFd
	 o/UD02KqiYyzaSNrhSX0C+oIIwUHGkp46uJTOIBlPsEI+eGYIfsZgHPRg8eNm2c2Lz
	 G3Jv1HGvV/SscLheSAEPyKim2RuOMJJwdy1uP4bv+8bhSOwsy8q5egdMxiYNlfNs+F
	 h1snDvXZbYNDMQSsZ78joXmKjpg8458TWwXT/yzi/qqCAJ/Bh4W66acI5ifiTAXntv
	 ZFPOdUYZlmguA==
Message-ID: <1afdedc1-65a2-4950-983f-9945009edeb7@kernel.org>
Date: Tue, 24 Feb 2026 16:17:53 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] rust/drm: Remove imports covered by prelude::*
To: Lyude Paul <lyude@redhat.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Ewan Chorynski <ewan.chorynski@ik.me>,
 Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, Shankari Anand <shankari.ak0208@gmail.com>,
 David Airlie <airlied@gmail.com>, Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>
References: <20260122214316.3281257-1-lyude@redhat.com>
 <20260122214316.3281257-2-lyude@redhat.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260122214316.3281257-2-lyude@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/22/26 10:43 PM, Lyude Paul wrote:
> This just removes any explicit imports of items in files that are already
> being pulled in by `use prelude::*;`.
> 
> There should be no functional changes in this patch.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Applied to drm-rust-next, thanks!
