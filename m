Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E576D3EA97B;
	Thu, 25 Jun 2026 16:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782405028; cv=none; b=Mfo699DGFvIJ2MhTJu/6arUJDLje0e89MlSuDyV7m0P3PPccYkASAhwlULi8OMlsXKxEQLs98nxNdoPpUwZ9s2wGo302729HyMIB6Ns7FMjjuGWHfcyxMO2AIEhXMXBIfHqbvPx4xgGFXGcMcxiFnJ6cTVmIqhz+LoEnS8RzLBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782405028; c=relaxed/simple;
	bh=H4eKpncreX/O0Z4vAiD11MB9Tx07/jGk3lwibtWGasI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IZ2k4BhFBz7M75je0b89m7R9TFXw/To9hHvE8XduQI/n3tlciMegEyiUqhW0WeobJLRvGnRjF6qxp17pcELHrqoTFCJU/gCbyxwPJuQR7vd0DDAqZmycBnb/S/4dBq8R9Pw0LeEgq4SpajT+bDHfus0azrB8OOtjqp5MUfwezTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bxKEnhLz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bxKEnhLz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F3251F00A3A;
	Thu, 25 Jun 2026 16:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782405027;
	bh=5veVpU8zzU+JxU7LUB1yUBOpJS0oL8ZtpCMm+3rkXGc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=bxKEnhLzlqcilwNUhLDXX7BQDj8/svseKGrGwwEpKOryPkaeAjEL7SRLAsfCxZ+aI
	 T8g3etHqRLf9VAC/Nj2mQxD73kK6iJms9UQrwAYVGOq8dkrfwrhqt0WCYU712a4y8D
	 PNob6qovGGHxl73+cu5W24yw2m4pauamTrRADqYR02p/oRPLjjw/VOGV8Bq2s8igF3
	 LszXLKYTl2+ypLsUKyA0EMIyHbf8ED6Dsggs9+Zc5QHL0qIlS/YJnCZ2ngXkWPJy8Y
	 Q19z+e2BjIB2dcBDCQLcGujVxCcSfUcLfIA0DyM+DI83HgmvcoKqx3qz84Aekx2DoX
	 9vQTNFZhdITFA==
Message-ID: <785a9dc0-c86b-4704-9709-1b95a76d5feb@kernel.org>
Date: Thu, 25 Jun 2026 18:30:24 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: USB: add rust.rs to USB subsystem file list
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <2026062533-achiness-outsell-a93a@gregkh>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <2026062533-achiness-outsell-a93a@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/25/26 5:08 PM, Greg Kroah-Hartman wrote:
> @@ -28054,6 +28054,7 @@ F:	include/dt-bindings/usb/
>  F:	include/linux/usb.h
>  F:	include/linux/usb/
>  F:	include/uapi/linux/usb/
> +F:	rust/kernel/usb.rs
Pretty minor, but maybe you still want to add rust/helpers/usb.c.

- Danilo
