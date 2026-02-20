Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC4934B697
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Feb 2026 14:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771596235; cv=pass; b=l1WCIrs5ftSL2F9LOqmp2KQ5VX696jDF8RpV8iCEdsrIbnFTttLx6SoXNGbh+PD8kT5HJHXQE/E5zPirk6W2Dk6x0Ru3sxWfzaSsKrWZ8hF6CTAjO3Lq9jW9EEfrmijlKISxye9vWJQTNBjL/P/HAylGwIgKch6KIK0njs7VtAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771596235; c=relaxed/simple;
	bh=lhk15j/cl2TOdEFsdG2r22cQKyQ2YQjmDrI3zrHVCkY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=inLWGXdXzPARVIEOrXy86cbdoYztmUeKoYsBCD57XiHMFfsud4zuMLLZCMhwnau//qWaPnse1YDnS5eD9+ibBg37EX8FyiNN/5BfpgK05mHP4tPo2mF0YxQrp9D50IjTyoceqYWrTLvKE9DDFw6h38+N7rwIs2BRZArMmdlJQuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=CjDCgnXP; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="CjDCgnXP"
ARC-Seal: i=1; a=rsa-sha256; t=1771596227; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=na/PVeTbSV57quP4075W+gAyXndhOrOKAfr9guq5J5bCDG+q7jqCez7TaTD4PHDZ8103M/hU41TMePZqI0oAh8uJ9vItXBhP47EPisw6+abyRsY5IB2WboazEjpTMzqun8djoPRP/r6DbgiOf5A34+todEKpcb+Ab2S95XGIc6g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771596227; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Hss0ExZ9YqaGFnovrBNOogefYBXYmBiHXblAHnhPYjc=; 
	b=b6lbCOJ4dc+vNGBWuKMqGKupL1y+UnjaO48aNjre4ne5yR3j9ikSmxfo0yEikZI8mNFfiAcxaZC04lXacKw1/c1vqpHsw2nqI7tJ8Im2lUIAYKwq7S7eaX4ykR1+yDqK7/+oR7zCTjiGOl/9d7zdu+pXK0C/wOXW1HV0/bdVNUY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771596227;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=Hss0ExZ9YqaGFnovrBNOogefYBXYmBiHXblAHnhPYjc=;
	b=CjDCgnXPyBeqSLiGxYhsaDA38Jkym8ZpHsN4ER6zNjR9bnokF670ucMuzSRKLL10
	VkcFNbGAhXVZiIBUNewn35oR8KJhYUJ7PjrLHsctjtxIjwaZi6knzYFGdJqN6UbUAcQ
	KiclCSCv4dhVK0O0J7fNXdrGiq1WhP64ZQ2VbnLk=
Received: by mx.zohomail.com with SMTPS id 1771596225427242.69170962146313;
	Fri, 20 Feb 2026 06:03:45 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 02/12] drm/tyr: move clock cleanup into Clocks Drop impl
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260212013713.304343-3-deborah.brouwer@collabora.com>
Date: Fri, 20 Feb 2026 11:03:29 -0300
Cc: dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 aliceryhl@google.com,
 boris.brezillon@collabora.com,
 beata.michalska@arm.com,
 lyude@redhat.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <AA5860A4-53D4-4571-BBB1-49ACB9F12243@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-3-deborah.brouwer@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 11 Feb 2026, at 22:37, Deborah Brouwer =
<deborah.brouwer@collabora.com> wrote:
>=20
> Currently Tyr disables its clocks from TyrDrmDeviceData::drop(), which
> causes them to be shut down before any other fields in =
TyrDrmDeviceData
> are dropped. This prevents us from using the clocks when dropping the
> other fields in TyrDrmDeviceData.
>=20
> In order to better control when the clocks are dropped, move this =
cleanup
> logic into a Drop implementation on the Clocks struct itself.
>=20
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
> drivers/gpu/drm/tyr/driver.rs | 23 +++++++++--------------
> 1 file changed, 9 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tyr/driver.rs =
b/drivers/gpu/drm/tyr/driver.rs
> index ae4daa12b3e5..9bc6ed56c45e 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -54,7 +54,7 @@ pub(crate) struct TyrPlatformDeviceData {
>     _device: ARef<TyrDrmDevice>,
> }
>=20
> -#[pin_data(PinnedDrop)]
> +#[pin_data]
> pub(crate) struct TyrDrmDeviceData {
>     pub(crate) pdev: ARef<platform::Device>,
>=20
> @@ -168,17 +168,6 @@ impl PinnedDrop for TyrPlatformDeviceData {
>     fn drop(self: Pin<&mut Self>) {}
> }
>=20
> -#[pinned_drop]
> -impl PinnedDrop for TyrDrmDeviceData {
> -    fn drop(self: Pin<&mut Self>) {
> -        // TODO: the type-state pattern for Clks will fix this.
> -        let clks =3D self.clks.lock();
> -        clks.core.disable_unprepare();
> -        clks.stacks.disable_unprepare();
> -        clks.coregroup.disable_unprepare();
> -    }
> -}
> -
> // We need to retain the name "panthor" to achieve drop-in =
compatibility with
> // the C driver in the userspace stack.
> const INFO: drm::DriverInfo =3D drm::DriverInfo {
> @@ -202,14 +191,20 @@ impl drm::Driver for TyrDrmDriver {
>     }
> }
>=20
> -#[pin_data]
> struct Clocks {
>     core: Clk,
>     stacks: OptionalClk,
>     coregroup: OptionalClk,
> }
>=20
> -#[pin_data]
> +impl Drop for Clocks {
> +    fn drop(&mut self) {
> +        self.core.disable_unprepare();
> +        self.stacks.disable_unprepare();
> +        self.coregroup.disable_unprepare();
> +    }
> +}
> +
> struct Regulators {
>     _mali: Regulator<regulator::Enabled>,
>     _sram: Regulator<regulator::Enabled>,
> --=20
> 2.52.0
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

