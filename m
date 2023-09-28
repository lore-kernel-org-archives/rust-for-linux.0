Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A2213AD3
	for <rust-for-linux@vger.kernel.org>; Thu, 28 Sep 2023 20:42:35 +0000 (UTC)
X-Greylist: delayed 575 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 28 Sep 2023 13:42:34 PDT
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3275F19D
	for <rust-for-linux@vger.kernel.org>; Thu, 28 Sep 2023 13:42:34 -0700 (PDT)
Received: from omf17.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 0A99E1608A0;
	Thu, 28 Sep 2023 20:32:58 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf17.hostedemail.com (Postfix) with ESMTPA id F31731E;
	Thu, 28 Sep 2023 20:32:54 +0000 (UTC)
Message-ID: <106c8bdb960da1568d0b3879efa76cd2acec032e.camel@perches.com>
Subject: Re: [PATCH] rust: Use awk instead of recent xargs
From: Joe Perches <joe@perches.com>
To: Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho
 <wedsonaf@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?ISO-8859-1?Q?Bj=F6rn?= Roy Baron
	 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas
	Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 28 Sep 2023 13:32:54 -0700
In-Reply-To: <20230928202116.2298150-1-mmaurer@google.com>
References: <20230928202116.2298150-1-mmaurer@google.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: F31731E
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Stat-Signature: 67tkdiae9ogk9pwpmkepescmsduebrbn
X-Rspamd-Server: rspamout08
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18Bt12lxOUK/nQPPHuW9jhdiJDE/X/B1DU=
X-HE-Tag: 1695933174-351742
X-HE-Meta: U2FsdGVkX1+Bb+eXtRzmfDkcJalEWFI1h+DdroDZ98TU2VBln2kEz1QIrF3HVTUf6bRGFWH/SU3QbNwxK/6cEUXTwms7Iu+5s/vpLULeFxUuaY/m1Av9DBokc8Vw0NQB0ZNMs/yK+e5wgo3cKbx3f/qYalKvE84nqPSsZ0junjAMxa9bV3i/92HnC21/nqnY6nfQi8PO5+qoZvse8Z6OC8ekbMpc72x+ymTzzajbC1Nw85rb3b2LCc1qIByoUUlAg5YlIKy0Rb0TeZzECDqHqV+TObjQY9Je5bpjaOoplPFWoCQTByAHOoC+Zj2c1sbX
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, 2023-09-28 at 20:21 +0000, Matthew Maurer wrote:
> `awk` is already required by the kernel build, and the `xargs` feature
> used in current Rust detection is not present in all `xargs` (notably,
> toybox based xargs, used in the Android kernel build).
[]
> diff --git a/rust/Makefile b/rust/Makefile
[]
> @@ -365,8 +365,7 @@ quiet_cmd_exports =3D EXPORTS $@
>        cmd_exports =3D \
>  	$(NM) -p --defined-only $< \
>  		| grep -E ' (T|R|D) ' | cut -d ' ' -f 3 \
> -		| xargs -Isymbol \
> -		echo 'EXPORT_SYMBOL_RUST_GPL(symbol);' > $@
> +		| awk 'NF {printf "EXPORT_SYMBOL_RUST_GPL(%s);\n",$$0}' > $@

Perhaps remove the cut as well and use $$3 instead of $$0 ?
Maybe integrate the grep as well.

