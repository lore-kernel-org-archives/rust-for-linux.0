Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFED623B62B;
	Sun, 28 Dec 2025 18:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766945533; cv=none; b=RicdJZ9fhWlGX9YRTzJR98EV0oSEpLIr82+CH937hOom0RfYxLwsCGXhNIJt/YQqpMIJvlH3NEQ6QVZroge606wEWw9wTKEpgYUzvbcrBfXp9JjrmvytX71DQsqhZdtEtwvHXcLmJ1N/bwaWSI8Wch56Fcj64npJWiaQwQoOGxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766945533; c=relaxed/simple;
	bh=/IAWDNwLFars79c2gnUeINB07TnywdknboHQf7VeZYA=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=l1j6yeaHA6w48LAazg2maWcN+Dq1GqK5jUbVu7T/NVvFZtq32th/782QRs/u7KlyET+p5vC/jEWNYgAuP2DDzMVAFkV1UGbe0WdI/yd7K4uc81EptRJfqFa/M0Kb6IWyIs+9wD/iaGu8SLkRcCWgSEK2r9BAc2wKh58MiusM+Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ak3zTnqC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ak3zTnqC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1A8EC4CEFB;
	Sun, 28 Dec 2025 18:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766945532;
	bh=/IAWDNwLFars79c2gnUeINB07TnywdknboHQf7VeZYA=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=Ak3zTnqCu86w6vP0rDexNx5IpONtdmgVT+RaXxSkyWa/oz6miwMhiCy4qIq5lkAud
	 JDXPCsfgmgdOIyCb50DKHKA/fpDk5I4IpOh5kIcZQeB5/2Wf+qdX9PkMw0ijO2aPc5
	 rMiCtTdoJjqp6afdCI2wLEo8tH72K0N8catwYP74HETbpfYzWdrqA2Cp7jh/n6EsKM
	 x+Ars2t6BB5Jo2EPI2enYvnQOXkA7iTOh63GZCC5AFb6KeKFhGheUf8uVs//Jzcn1u
	 bCI97Zi/U77gh8nTP9OfPXqaYoEfu/FOgzf7G0YOQ2wnf6NfHvpWEwlwL7GWoMRWZg
	 qON74q75yw0vA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 28 Dec 2025 19:12:08 +0100
Message-Id: <DFA1WXRTC62E.3825Z5WT388SJ@kernel.org>
To: "Matthew Maurer" <mmaurer@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 2/3] docs: ABI: sysfs-devices-soc: Fix swapped sample
 values
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Lee
 Jones" <lee@kernel.org>
References: <20251226-soc-bindings-v4-0-2c2fac08f820@google.com>
 <20251226-soc-bindings-v4-2-2c2fac08f820@google.com>
In-Reply-To: <20251226-soc-bindings-v4-2-2c2fac08f820@google.com>

On Fri Dec 26, 2025 at 9:17 PM CET, Matthew Maurer wrote:
> The sample values for `family` and `machine` were swapped relative to
> what the driver actually does, and doesn't match the field description.
>
> Reviewed-by: Lee Jones <lee@kernel.org>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Fixes: da5a70f3519f ("Documentation: add information for new sysfs soc bus =
functionality")

> ---
>  Documentation/ABI/testing/sysfs-devices-soc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-devices-soc b/Documentation/=
ABI/testing/sysfs-devices-soc
> index 5269808ec35f8e2b18516556f886c77f5fac9401..cb6776a4afe02a76fe27ac6fc=
236babdc7865287 100644
> --- a/Documentation/ABI/testing/sysfs-devices-soc
> +++ b/Documentation/ABI/testing/sysfs-devices-soc
> @@ -17,14 +17,14 @@ Date:		January 2012
>  contact:	Lee Jones <lee@kernel.org>
>  Description:
>  		Read-only attribute common to all SoCs. Contains the SoC machine
> -		name (e.g. Ux500).
> +		name (e.g. DB8500).
> =20
>  What:		/sys/devices/socX/family
>  Date:		January 2012
>  contact:	Lee Jones <lee@kernel.org>
>  Description:
>  		Read-only attribute common to all SoCs. Contains SoC family name
> -		(e.g. DB8500).
> +		(e.g. ux500).

Is the change from "Ux500" to "ux500" intended?

(If not, no need to resend, I can fix it up on apply.)
