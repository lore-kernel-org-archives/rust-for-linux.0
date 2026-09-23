Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DD35335B9;
	Wed, 23 Sep 2026 13:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171784; cv=pass; b=uFfKvAdd0NVHgmhu0WZXVetUO2ZBKmUErh95vbqmkcsOBbcZt6BwKhedMU+9K30Ksj9acd21TQnQrNxabOX/KdbGBluIqvS5ugP3pETW4JcSWWbwn73hFA9Y+wz+dlTSQeZ4ESm24W9Rst/PdMPzcFMmkQfsLAoU1kxE7kW2qPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171784; c=relaxed/simple;
	bh=e5rCE/NpTu2hHN4ys+aQq7EIL4uwWec0MOhYfjgqYME=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=D/Xq9LIp86ugDYg1KZxa/r5OIryvlIfh0JJD/xChfSl8xfjzNxi+7Cn0QQvldzpkdTniR4F7UjhqsLi0/9mZjBqUyhRNzFv3t16yRqFXrzKUEszVU8zJ1iRKU+0dIG6q51dL1nlnAN9Pz2w26gLlePjAhmvVKp9BZp+kUIFJadE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=TiYhf6YM; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="TiYhf6YM"
ARC-Seal: i=1; a=rsa-sha256; t=1790171766; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HzlfVPlm08mezYrgSDzkouwgLc27+1IAk59eOLUi9TWCWt8wYUtJB/3hlcP5wQsG8wrn6TiO8ttkojGa0XJ5iiUDUfs/7jrRtuT7/PxqlGna6vVQsNC/vDokGquFtO7N+HiiqdR5lhRzOgRExLqLap6ZXwyWPfoNR5MelNc+NWc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790171766; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=e5rCE/NpTu2hHN4ys+aQq7EIL4uwWec0MOhYfjgqYME=; 
	b=AUGlB6eMxkIrxiaaCUWeRIrxtgO7CAU9ZNitF03rhjAmXsh7LQdXJxuDOfhSpFWvlMTHp8cajyO0fbUsJrffV/DLRzbDZT12GR0hB5iP+KzjkZpdgou7wy8oOs2WXaMAoyldVfESbwWukM4EF1hOyzJx2A9OtgJxhhwoxMKrdyk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790171766;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=e5rCE/NpTu2hHN4ys+aQq7EIL4uwWec0MOhYfjgqYME=;
	b=TiYhf6YMeJsw/e1oz2PDXJpK0MmhqEoVpoUC35ktns/EEa85WKq492yXVFVC2Md1
	uqMjS5Fm10qq/YOxWsMpGFotyxshmDwzNBuAdU1g+jNIGWfMoHnAdJRcdq4OjN7EBmv
	F1f7PgM0dW+QxltRXA40oo77rrLHggJUVNh26Ac0=
Received: by smtp.zohomail.com with SMTPS id 1790171764587671.1814275931353;
	Wed, 23 Sep 2026 06:56:04 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH v7 3/3] drm/tyr: put iomem behind the hardware gate
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260912-tyr-reset-impl-v7-3-077ce72084eb@onurozkan.dev>
Date: Wed, 23 Sep 2026 10:55:48 -0300
Cc: linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 dakr@kernel.org,
 aliceryhl@google.com,
 airlied@gmail.com,
 simona@ffwll.ch,
 ojeda@kernel.org,
 boqun@kernel.org,
 gary@garyguo.net,
 bjorn3_gh@protonmail.com,
 lossin@kernel.org,
 a.hindborg@kernel.org,
 tmgross@umich.edu
Content-Transfer-Encoding: quoted-printable
Message-Id: <D5DC5A3D-E1A9-4C2B-9B7D-5AEF3EA0AA07@collabora.com>
References: <20260912-tyr-reset-impl-v7-0-077ce72084eb@onurozkan.dev>
 <20260912-tyr-reset-impl-v7-3-077ce72084eb@onurozkan.dev>
To: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: Apple Mail (2.3901.100.1.1.11)
X-ZohoMailClient: External



> On 12 Sep 2026, at 07:39, Onur =C3=96zkan <work@onurozkan.dev> wrote:
>=20
> Move iomem mapping into HwGate and pass Arc<HwGate> to components that
> access hardware. Callers obtain HwAccessGuard before accessing the =
iomem
> so the reset worker waits for ongoing accesses.
>=20
> Acquire the gate once per address-space operation and pass the guarded
> iomem reference to its helpers. This prevents nested gate acquisition
> from deadlocking with reset and keeps each operation protected =
throughout.
> Clone the gate Arc before acquiring the guard so mutating helpers can
> retain their mutable self receivers.
>=20
> Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>


Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

