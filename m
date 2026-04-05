Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724A1C2FF;
	Sun,  5 Apr 2026 15:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775402178; cv=none; b=DKbIUeFnvlIRb+wZR24jwjmJFM9Gj5FfUA7R6pzGqLczXLGytlsTNRDa4bKqUsHWCaswzgEp+87xq+PY33g9X1FjteHruQbr7ABjpSJiJl4ogkijDAvaZHczIFZywUubB3AGGhwvBHry+WNDO51SIjOg0g1YzNcPsVj5YkRZXFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775402178; c=relaxed/simple;
	bh=6g09EURhYy3Cp48wms83gZhqkYPf0V7+pM6AQscVWaE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Dha2Rrb9cR9XJktX0QPDwEr5WBsJ2vjmnIa8HnrXX4qtPqmW3KmDU0QJQL89kBZF3hXTEqX26G3NLp2kfFp0GCM0Av/3/TzbVWvtW4hezw0o1vtM8sE6CeTG9Vr/+8M41BX6JpxZ+tVwipFT8NPTw/Ubri39enfOlqjd+rcBCu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KjcQU0+W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KjcQU0+W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF0CC116C6;
	Sun,  5 Apr 2026 15:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775402178;
	bh=6g09EURhYy3Cp48wms83gZhqkYPf0V7+pM6AQscVWaE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=KjcQU0+WqD1hRfwRmWHz7FNvqaUpfENoU6L78edJ9DKmnAYRINvBljjTfhUR6dBni
	 eSeY4LMBoXhR9gfSXCpx8fbex3RgjDpqkteEBizOqArmWZLbz34JM+6VomNeeFY+xO
	 XRLAtL7GN00nRRKjEqzyXXLmiVsHrFr0MaDJqXYezf++xGhfTdAFzq45oAGRYmspee
	 q2jNoN5NahAFSOQbH3OQBtDxl+LsYhHO1uEisxP6hiVr7aROerp5q7TLW7Bc+o+FVb
	 84BN++zkzL17WOD7/jxqhJzM+FLcY6nBYZUuO4MxEI4UfDIJVTLffsR46V3vokV4eg
	 6pRsqT1CQIOWg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 05 Apr 2026 17:16:11 +0200
Message-Id: <DHLBJM6MGHZP.2UP49SIMCBN9B@kernel.org>
Subject: Re: [PATCH v2 0/3] Fix all clippy warnings in drm-rust-next
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260404212831.78971-1-jhubbard@nvidia.com>
In-Reply-To: <20260404212831.78971-1-jhubbard@nvidia.com>

On Sat Apr 4, 2026 at 11:28 PM CEST, John Hubbard wrote:
> John Hubbard (3):
>   gpu: nova-core: vbios: use from_le_bytes() for PCI ROM header parsing

Applied to drm-rust-next, thanks!
